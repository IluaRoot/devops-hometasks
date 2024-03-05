resource "kubernetes_ingress_v1" "wcg-ingress-name" {
  metadata {
    name = var.ingress_name
  }
  spec {
    rule {
      host = var.ingress_hostname
      http {
        path {
          path      = "/"
          path_type = "Exact"
          backend {
            service {
              name = var.service_name
              port {
                number = var.service_target_port
              }
            }
          }
        }
      }
    }
  }
}