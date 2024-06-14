# Needs the Turbot Pipe mod: AWS Perimeter
benchmark "aws_perimeter_security" {
  title         = "Security"
  children = [
    aws_perimeter.benchmark.public_access,
  ]

  tags = merge(local.aws_perimeter_common_tags, {
    type = "Benchmark"
  })
}