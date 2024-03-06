variable "replica_num" {}
variable "service_port" {}
variable "service_name" { type = string }
variable "service_target_port" { type = number }
variable "github_token" { type = string }
variable "repo_var" { type = string }
variable "git_branch" { type = string }
variable "commit_msg" { type = string }
variable "commit_auth" { type = string }
variable "commit_mail" { type = string }

variable "container_name" {
  type    = string
  default = "wcg-depl-terra-v1"
}

variable "label_name" {
  type    = string
  default = "wcg-depl-terra-v1"
}

variable "image_name" {
  type    = string
  default = "ghcr.io/iluaroot/wcg:latest"
}

variable "docker_image" {
  type    = string
  default = "wcg:latest"
}

variable "ingress_name" {
  type    = string
  default = "wcg-app-ingress"
}

variable "ingress_hostname" {
  type    = string
  default = "wcg-app-terraform.io"

}
