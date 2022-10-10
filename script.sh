#!/bin/bash

echo "Criando as imagens........"

docker build -t /Documentos/Aulas/Kubernetes/Dio_Kubernetes/k8s-projeto1-app-base-main backend/.
docker build -t /Documentos/Aulas/Kubernetes/Dio_Kubernetes/k8s-projeto1-app-base-main database/.

exho "Realizando o push das imagens...."

docker push /Documentos/Aulas/Kubernetes/Dio_Kubernetes/k8s-projeto1-app-base-main:/projeto-backend:1.0
docker push /Documentos/Aulas/Kubernetes/Dio_Kubernetes/k8s-projeto1-app-base-main:1.0/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments......"

kubectl apply -f ./deployment.yml