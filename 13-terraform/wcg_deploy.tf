resource "kubernetes_deployment" "wc-gen-terra-depl" {
  metadata {
    name = var.label_name
    labels = {
      app = var.label_name
    }
  }

  spec {
    replicas = var.replica_num

    selector {
      match_labels = {
        app = var.label_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.label_name
        }
      }

      spec {
        container {
          image = var.image_name
          name  = var.container_name
          port {
            container_port = var.service_port
          }
        }
      }
    }
  }
}