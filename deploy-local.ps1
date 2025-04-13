# deploy-local.ps1

# Start Minikube if not running
if (-not (minikube status | Select-String "Running")) {
    Write-Host "Starting Minikube..."
    minikube start
}

# Set Docker env (optional for image builds)
& minikube docker-env | Invoke-Expression

# Deploy using Helm
helm upgrade --install nginx ./charts/nginx --namespace default --create-namespace
