
output "kubeconfig" {
  value = kind_cluster.local_cluster.kubeconfig
}

output "endpoint" {
  value = kind_cluster.local_cluster.endpoint
}

output "client_certificate" {
  value = kind_cluster.local_cluster.client_certificate
}

output "client_key" {
  value = kind_cluster.local_cluster.client_key
}

output "cluster_ca_certificate" {
  value = kind_cluster.local_cluster.cluster_ca_certificate
}