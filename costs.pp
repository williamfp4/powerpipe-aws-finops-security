# Needs the Turbot Pipe mod: AWS Thrifty
benchmark "aws_perimeter_costs" {
  title         = "Costs"
  children = [
    aws_thrifty.control.ec2_application_lb_unused,
    aws_thrifty.control.rds_db_instance_with_graviton
  ]

}