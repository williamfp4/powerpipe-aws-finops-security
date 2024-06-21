# Needs the Turbot Pipe mod: AWS Perimeter
benchmark "aws_perimeter_security" {
  title         = "Security"
  children = [
    benchmark.aws_iam,
    benchmark.aws_secrets,
    aws_perimeter.benchmark.public_access
  ]

  tags = merge(local.aws_perimeter_common_tags, {
    type = "Benchmark"
  })
}

benchmark "aws_iam" {
  title = "IAM"
  children = [
    aws_compliance.control.iam_policy_custom_no_permissive_role_assumption
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
