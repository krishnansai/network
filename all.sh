echo "HAPPY HACKING"
echo "createing namespace sai "
kubectl create ns sai
echo "passing secret file"
kubectl create secret generic dbsecret -n sai  \
--from-literal=DB_HOST='gokul.cw1yb5r4oc0w.us-west-2.rds.amazonaws.com'  \
 --from-literal=DB_USER=sai --from-literal=DB_PASSWORD=sai12345 \
 --from-literal=DB_DATABASE=userDB --from-literal=DB_PORT=3306 --from-literal=PORT=4000
echo " "
echo "deploying pod service and hpa"
kubectl apply -n sai -f final.yaml
echo "Installing kube metrics, prometheus using helm"
echo "finally press ctrl+c"
./first.sh
echo " installing grafana"
./end.sh
echo "working fine"

echo "checking my open port script"
./scan.sh
echo "kubectl get service -n grafana"
