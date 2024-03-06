resource "github_repository_file" "name" {
  for_each = { file1 = "config.tf",
    file2 = "github_push.tf",
    file3 = "terraform.tfvars",
    file4 = "vars.tf",
    file5 = "wcg_deploy.tf",
    file6 = "wcg_ingress.tf",
    file7 = "wcg_service_port.tf",
  file8 = "README.md" }

  repository     = var.repo_var
  branch         = var.git_branch
  file           = "13-terraform/${each.value}"
  content        = file("${each.value}")
  commit_message = var.commit_msg
  commit_author = var.commit_auth
  commit_email = var.commit_mail


  overwrite_on_create = true
}