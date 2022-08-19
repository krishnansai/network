echo "repo add helm"
helm repo add grafana https://grafana.github.io/helm-charts 
echo "helm update"
helm repo update 
echo "creating yaml file"
echo "datasources:
  datasources.yaml:
    apiVersion: 1
    datasources:
    - name: Prometheus
      type: prometheus
      url: http://prometheus-server.prometheus.svc.cluster.local
      access: proxy
      isDefault: true">prometheus-datasource.yaml

kubectl create namespace grafana

helm install grafana grafana/grafana \
    --namespace grafana \
    --set persistence.storageClassName="gp2" \
    --set persistence.enabled=true \
    --set adminPassword='sai12345' \
    --values prometheus-datasource.yaml \
    --set service.type=LoadBalancer

kubectl get service -n grafana

