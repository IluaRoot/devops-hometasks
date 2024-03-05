resource "kubernetes_service" "wcg_service_port" {
  metadata {
    name = var.service_name
  }
  spec {
    selector = {
      app = var.label_name
    }
    port {
      port        = var.service_port
      target_port = var.service_target_port
    }
    type = "ClusterIP"
  }
}