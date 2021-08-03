output "repo-url" {
  value = "${aws_codecommit_repository.repo.clone_url_http}"
}