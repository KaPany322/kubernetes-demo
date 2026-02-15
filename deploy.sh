set -e
NAME="kubernetes-demo-api"
USERNAME="kapany322"
IMAGE="$USERNAME/$NAME:latest"

echo "Building the Docker image..."
docker build -t $IMAGE .

echo "Pushing the Docker image to Docker Hub..."
docker push $IMAGE

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods..."#
kubectl get pods

echo "Getting services..."
kubectl get services

echo "Fetching the main service..."
kubectl get service $NAME-service