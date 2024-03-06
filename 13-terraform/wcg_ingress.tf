resource "kubernetes_ingress_v1" "wcg-ingress-name" {
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