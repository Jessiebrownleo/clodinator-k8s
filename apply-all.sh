#!/bin/bash

# 1. Apply Infrastructure (DBs, Brokers)
echo "Deploying Infrastructure (Postgres, Redis, Kafka)..."
kubectl apply -f cloudinator-k8s/infrastructure/postgres/
kubectl apply -f cloudinator-k8s/infrastructure/redis/
kubectl apply -f cloudinator-k8s/infrastructure/kafka/

echo "Waiting for infrastructure to be ready..."
sleep 15

# 2. Apply Eureka Server (Service Discovery)
echo "Deploying Eureka Server..."
kubectl apply -f cloudinator-k8s/eureka-server/
sleep 10

# 3. Apply Core Services
echo "Deploying Core Services (Identity, Gateway)..."
kubectl apply -f cloudinator-k8s/identity-service/
kubectl apply -f cloudinator-k8s/gateway-server/

# 4. Apply Backend Services
echo "Deploying Backend Services..."
kubectl apply -f cloudinator-k8s/workspace-service/
kubectl apply -f cloudinator-k8s/deployment-service/
kubectl apply -f cloudinator-k8s/infrastructure-service/

# 5. Apply Frontend
echo "Deploying Frontend..."
kubectl apply -f cloudinator-k8s/cloudinator-ui/

echo "✅ All services applied successfully!"
