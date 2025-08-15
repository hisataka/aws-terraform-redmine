resource "aws_ecr_repository" "redmine" {
    name = "iacredmine"
}

output "ecr_repository_uri" {
    value = aws_ecr_repository.redmine.repository_url
}