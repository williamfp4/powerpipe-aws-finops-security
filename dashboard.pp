benchmark "aws_finops_security" {
  title = "Powerpipe - AWS FinOps & Security"
  children = [
    benchmark.aws_perimeter_security,
    benchmark.aws_perimeter_costs
  ]
}
