resource "kubernetes_ingress" "wcg-ingress-name" {
  metadata {
    name = var.ingress_name
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }
  spec {
    rule {
      host = var.ingress_hostname
      http {
        path {
          path = "/tfapp"
          backend {
            service_name = var.service_name
            service_port = var.service_target_port
          }
        }
      }
    }
  }
}