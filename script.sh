#!/bin/bash

echo "Criando as imagens..."

docker build -t abnersilvabarbosa/projeto-dio-backend:1.0 backend/.
docker build -t abnersilvabarbosa/projeto-dio-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push abnersilvabarbosa/projeto-dio-backend:1.0
docker push abnersilvabarbosa/projeto-dio-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments no cluster kubernetes..."

kubectl apply -f ./deployments.yml