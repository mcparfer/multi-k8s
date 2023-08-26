docker build -t mcparfer/multi-client -f ./client/Dockerfile ./client
docker build -t mcparfer/multi-server -f ./server/Dockerfile ./server
docker build -t mcparfer/multi-worker -f ./worker/Dockerfile ./worker
docker push mcparfer/multi-client
docker push mcparfer/multi-server
docker push mcparfer/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=mcparfer/multi-server