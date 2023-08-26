docker build -t mcparfer/multi-client:latest -t mcparfer/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t mcparfer/multi-server:latest -t mcparfer/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t mcparfer/multi-worker:latest -t mcparfer/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push mcparfer/multi-client:latest
docker push mcparfer/multi-server:latest
docker push mcparfer/multi-worker:latest
docker push mcparfer/multi-client:$SHA
docker push mcparfer/multi-server:$SHA
docker push mcparfer/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=mcparfer/multi-server:$SHA
kubectl set image deployments/client-deployment client=mcparfer/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=mcparfer/multi-worker:$SHA