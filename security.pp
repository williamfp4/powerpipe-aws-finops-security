# Needs the Turbot Pipe mod: AWS Perimeter
benchmark "aws_perimeter_security" {
  title         = "Security"
  children = [
    benchmark.aws_iam,
    benchmark.aws_secrets,
    benchmark.aws_security_group,
    benchmark.aws_best_practices,
    benchmark.aws_public_access,
  ]

  tags = merge(local.aws_perimeter_common_tags, {
    type = "Benchmark"
  })
}

benchmark "aws_iam" {
  title = "IAM"
  children = [
    aws_compliance.control.cis_v300_1_4,
    aws_compliance.control.cis_v300_1_5,
    aws_compliance.control.cis_v300_1_7,
    aws_compliance.control.cis_v300_1_10,
    aws_compliance.control.cis_v300_1_16,
    aws_compliance.control.cis_v300_1_19,
    aws_compliance.control.foundational_security_iam_1,
    aws_compliance.control.foundational_security_iam_21,
    aws_compliance.control.iam_role_cross_account_read_only_access_policy,
    aws_compliance.control.iam_role_no_administrator_access_policy_attached,
    control.iam_user_administrator_access,
    aws_compliance.control.ec2_instance_no_iam_role_with_privilege_escalation_risk_access,
    aws_compliance.control.iam_policy_custom_no_permissive_role_assumption
  ]
}

benchmark "aws_best_practices"{
  title = "Best practices"
  children = [
    aws_compliance.control.cis_v300_3_1,
    aws_compliance.control.sns_topic_encrypted_at_rest,
    aws_compliance.control.acm_certificate_expires_30_days,
    aws_compliance.control.foundational_security_ssm_2
  ]
}

benchmark "aws_security_group"{
  title = "Security Group"
  children = [
    aws_perimeter.benchmark.security_group_access,
    aws_compliance.control.foundational_security_ec2_19,
    aws_compliance.control.cis_v300_5_4,
  ]
}

benchmark "aws_secrets" {
  title = "Exposed Secrets"
  children = [
    aws_compliance.control.lambda_function_variables_no_sensitive_data,
    aws_compliance.control.ec2_instance_user_data_no_secrets,
    aws_compliance.control.autoscaling_ec2_launch_configuration_no_sensitive_data,
    aws_compliance.control.ecs_task_definition_container_environment_no_secret,
    aws_compliance.control.cloudformation_stack_output_no_secrets
  ]
}

benchmark "aws_public_access" {
  title = "AWS Public Access"
  children = [
    aws_perimeter.benchmark.public_access,
    aws_compliance.control.emr_account_public_access_blocked
  ]
}

control "iam_user_administrator_access" {
  title       = "Ensure IAM Users not attached with AdministratorAccess policy"
  description = "AWS IAM Users should not be attached AdministratorAccess policy."
  query       = query.iam_user_administrator_access
}

query "iam_user_administrator_access" {
  sql = <<-EOQ
    with admin_users as (
        select
            arn,
            name,
            attachments
        from
        aws_iam_user,
        jsonb_array_elements_text(attached_policy_arns) as attachments
        where
        split_part(attachments, '/', 2) = 'AdministratorAccess'
    )
    select
        u.arn as resource,
        case
            when au.arn is not null then 'alarm'
        else 'ok'
        end as status,
        case
            when au.arn is not null then u.name || ' have AdministratorAccess policy attached.'
        else u.name || ' does not have AdministratorAccess policy attached.'
        end as reason
    from
        aws_iam_user as u
        left join admin_users au on u.arn = au.arn
    order by
        u.name;
    }
  EOQ
}