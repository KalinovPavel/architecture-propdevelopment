#!/bin/bash

# Применяем Roles и RoleBindings
kubectl apply -f roles.yaml
kubectl apply -f role-bindings.yaml

# Создаём сервисные аккаунты (viewer, editor, admin) в namespace=default
kubectl create serviceaccount viewer -n default
kubectl create serviceaccount editor -n default
kubectl create serviceaccount admin -n default

# Генерируем (запрашиваем) их токены (доступно с k8s 1.24+)
kubectl create token viewer -n default
kubectl create token editor -n default
kubectl create token admin -n default
