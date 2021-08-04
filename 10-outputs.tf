output "repo_url" {
  value = aws_codecommit_repository.repo.clone_url_http
}

output "alb_dns" {
  value = aws_lb.app-lb.dns_name
}