kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts 

helm repo update 

kubectl create namespace prometheus

helm install prometheus prometheus-community/prometheus \
    --namespace prometheus \
    --set alertmanager.persistentVolume.storageClass="gp2" \
    --set server.persistentVolume.storageClass="gp2"

kubectl port-forward deployment/prometheus-server 9090:9090 -n prometheus 
