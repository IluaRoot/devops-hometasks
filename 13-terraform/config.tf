terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    
  }
  backend "kubernetes" {
    secret_suffix = "state"
    config_path   = "~/.kube/config"
  }
}

provider "github" {
  token = var.github_token
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}