#!/bin/bash

echo "🗑️  Deleting Cloudinator Resources..."

# 1. Delete Frontend
echo "Deleting Frontend..."
kubectl delete -f cloudinator-ui/ --ignore-not-found

# 2. Delete Backend Services
echo "Deleting Backend Services..."
kubectl delete -f infrastructure-service/ --ignore-not-found
kubectl delete -f deployment-service/ --ignore-not-found
kubectl delete -f workspace-service/ --ignore-not-found

# 3. Delete Core Services
echo "Deleting Core Services..."
kubectl delete -f gateway-server/ --ignore-not-found
kubectl delete -f identity-service/ --ignore-not-found

# 4. Delete Eureka Server
echo "Deleting Eureka Server..."
kubectl delete -f eureka-server/ --ignore-not-found

# 5. Delete Infrastructure
echo "Deleting Infrastructure (Postgres, Redis, Kafka)..."
kubectl delete -f infrastructure/kafka/ --ignore-not-found
kubectl delete -f infrastructure/redis/ --ignore-not-found
kubectl delete -f infrastructure/postgres/ --ignore-not-found

echo "✅ All resources deleted!"
