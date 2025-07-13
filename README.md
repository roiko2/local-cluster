## 🚀 Local k8s Environment for Podinfo Apps

## Prerequisites
- docker
- helm
- terraform

### Instructions
-  Run ```export KUBECONFIG=/tmp/config``` (for direct kubeconfig to the one created by terraform) on local terminal.
    - Possible to override kubeconfig path with ```kubeconfig_path``` terraform var. 

### Create the Local Kubernetes Cluster
```bash
cd terraform/local-cluster
terraform init
terraform apply --auto-approve
```

### Deploy Kubernetes Components with Helm
```bash
cd charts
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx && helm repo update
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \            
  --namespace ingress-nginx --create-namespace \
  --values ingress-controller/ingress-nginx.yaml
helm upgrade --install podinfo ./charts/podinfo-webapp \
  -f environments/production/official-podinfo/values.yaml \
  --namespace official-podinfo --create-namespace
helm upgrade --install podinfo ./charts/podinfo-webapp \   
  -f environments/production/custom-podinfo/values.yaml \
  --namespace custom-podinfo --create-namespace
```

### Access the Applications


- ```http://lcoalhost/official``` → Official Podinfo
- ```http://lcoalhost/custom``` → Custom Podinfo`

### Build a new version for custom podinfo app
```bash
cd custom-podinfo
docker build -t custom-podinfo:latest . 
docker tag custom-podinfo roiko5/custom-podinfo
docker push roiko5/custom-podinfo
```  

### Cleanup
To destroy the local cluster and clean up resources:  
```bash
cd terraform/local-cluster
terraform destroy --auto-approve
```
