kubectl create namespace qube
kubectl apply -f postgres-secrets.yml -n qube
sleep 2
kubectl apply -f postgres-storage.yaml -n qube
sleep 2
kubectl apply -f postgres-deployment.yaml -n qube
sleep 2
kubectl apply -f postgres-service.yaml -n qube
sleep 2
kubectl apply -f sonar-pv-data.yml -n qube
sleep 2
kubectl apply -f sonar-pv-extensions.yml -n qube
sleep 2
kubectl apply -f sonar-pvc-data.yml -n qube
sleep 2
kubectl apply -f sonar-pvc-extentions.yml -n qube
sleep 2
kubectl apply -f sonar-configmap.yaml -n qube
sleep 2
kubectl apply -f sonar-deployment.yml -n qube
sleep 2
kubectl apply -f sonar-service.yml -n qube
echo "Good Day"
