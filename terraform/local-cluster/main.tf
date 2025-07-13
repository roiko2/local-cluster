resource "kind_cluster" "local_cluster" {
  name            = var.cluster_name
  kubeconfig_path = pathexpand(var.kubeconfig_path)
  wait_for_ready  = var.wait_for_ready

  kind_config {
    kind        = "Cluster"
    api_version = var.api_version

    node {
      role = "control-plane"
      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
      ]
      dynamic "extra_port_mappings" {
        for_each = var.control_plane_port_mappings
        content {
          container_port = extra_port_mappings.value.container_port
          host_port      = extra_port_mappings.value.host_port
        }
      }
    }

    dynamic "node" {
      for_each = range(var.worker_nodes_count)
      content {
        role = "worker"
      }
    }
  }
}
