variable "cluster_name" {
  type        = string
  default     = "test-cluster"
}

variable "kubeconfig_path" {
  type        = string
  default     = "/tmp/config"
}

variable "wait_for_ready" {
  type        = bool
  default     = true
}

variable "api_version" {
  type        = string
  default     = "kind.x-k8s.io/v1alpha4"
}

variable "control_plane_port_mappings" {
  type = list(object({
    container_port = number
    host_port      = number
  }))
  default = [
    {
      container_port = 80
      host_port      = 80
    },
    {
    container_port = 443
    host_port      = 443
     }
  ]
}

variable "worker_nodes_count" {
  type        = number
  default     = 1
}
