kubectl delete deploy postgres sonarqube -n qube
kubectl delete svc postgres sonarqube -n qube
kubectl delete pvc postgres-pv-claim sonar-data sonar-extensions -n qube
kubectl delete pv postgres-pv-volume sonar-pv-data sonar-pv-extensions -n qube
kubectl delete configmaps sonar-config -n qube
kubectl delete secrets postgres-secrets -n qube
kubectl delete ns qube
