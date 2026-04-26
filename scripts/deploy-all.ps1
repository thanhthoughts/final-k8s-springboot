Write-Host "Starting Minikube..."
minikube start --driver=docker --memory=6144 --cpus=4 --disk-size=30g

Write-Host "Building and loading Spring Boot Docker image..."
docker build -t springboot-mysql-app:1.0 .
minikube image load springboot-mysql-app:1.0

Write-Host "Deploying MySQL ConfigMap, PV, PVC, Deployment, and Service..."
kubectl apply -f k8s/mysql-configmap.yaml
kubectl apply -f k8s/mysql-pv.yaml
kubectl apply -f k8s/mysql-pvc.yaml
kubectl apply -f k8s/mysql-deployment.yaml
kubectl apply -f k8s/mysql-service.yaml

Write-Host "Waiting for MySQL..."
kubectl rollout status deployment/mysql-deployment --timeout=300s

Write-Host "Deploying Jenkins..."
kubectl apply -f k8s/jenkins-deployment.yaml
kubectl apply -f k8s/jenkins-service.yaml

Write-Host "Deploying Nexus..."
kubectl apply -f k8s/nexus-deployment.yaml
kubectl apply -f k8s/nexus-service.yaml

Write-Host "Deploying Spring Boot webapp..."
kubectl apply -f k8s/webapp-deployment.yaml
kubectl apply -f k8s/webapp-service.yaml
kubectl rollout status deployment/webapp-deployment --timeout=300s

Write-Host "Checking all Kubernetes resources..."
kubectl get configmap
kubectl get pv
kubectl get pvc
kubectl get deployments
kubectl get pods
kubectl get services

Write-Host "Webapp URL:"
minikube service webapp-service --url
