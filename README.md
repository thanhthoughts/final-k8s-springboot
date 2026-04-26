# Final Kubernetes Deployment Project

This project satisfies the final assignment:

- Spring Boot Hello World app connected to MySQL
- GitHub project
- Kubernetes Jenkins deployment
- Kubernetes Nexus deployment
- Kubernetes MySQL deployment
- MySQL ConfigMap
- Jenkinsfile to checkout code, build jar, and push to Nexus
- Kubernetes webapp deployment
- PV
- PVC
- Service files
- Script to start Minikube and deploy everything automatically

## Windows Run

Open Administrator PowerShell in this folder:

```powershell
.\scripts\deploy-all.ps1
```

## Test webapp

```powershell
minikube service webapp-service --url
curl.exe http://127.0.0.1:PORT
```
