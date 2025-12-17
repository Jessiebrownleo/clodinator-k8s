#!/bin/bash

# Apply Eureka Server (Service Discovery) first
kubectl apply -f cloudinator-k8s/eureka-server/

# Wait for Eureka to potentially be ready (optional, or just sleep)
echo "Waiting for Eureka Server to be ready..."
sleep 10

# Apply Config Server if it exists (not identified in source but in docker-compose)
# kubectl apply -f cloudinator-k8s/config-server/

# Apply Core Services
kubectl apply -f cloudinator-k8s/identity-service/
kubectl apply -f cloudinator-k8s/gateway-server/

# Apply Backend Services
kubectl apply -f cloudinator-k8s/workspace-service/
kubectl apply -f cloudinator-k8s/deployment-service/
kubectl apply -f cloudinator-k8s/infrastructure-service/

# Apply Frontend
kubectl apply -f cloudinator-k8s/cloudinator-ui/

echo "All services applied."
