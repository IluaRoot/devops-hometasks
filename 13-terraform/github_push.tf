resource "github_repository_file" "name" {
  for_each = { file1 = "config.tf",
               file2 = "github_push.tf",
               file3 = "terraform.tfvars",
               file4 = "vars.tf",
               file5 = "wcg_deploy.tf",
               file6 = "wcg_ingress.tf",
               file7 = "wcg_service_port.tf" }

  repository = var.repo_var
  branch     = var.git_branch
  file       = "13-terraform/${each.value}"
  content    = file("${each.value}")
  commit_message = "13-terraform push hometask"

  overwrite_on_create = true
}