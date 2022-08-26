#!/bin/bash

createing()
{
figlet Creating
echo "HAPPY HACKING"
echo "createing namespace sai "
kubectl create ns sai
echo "passing secret file"
kubectl create secret generic dbsecret -n sai --from-literal=DB_HOST='gokul.cw1yb5r4oc0w.us-west-2.rds.amazonaws.com' --from-literal=DB_USER=sai --from-literal=DB_PASSWORD=sai12345 --from-literal=DB_DATABASE=userDB --from-literal=DB_PORT=3306 --from-literal=PORT=4000
echo " "
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
echo " "
echo "deploying pod service and hpa"
kubectl apply -n sai -f svc.yaml
kubectl apply -n sai -f deployment.yaml
kubectl apply -n sai -f hpa.yaml --validate=false
echo "finally press ctrl+c"
./first.sh
echo " installing grafana"
./end.sh
echo "working fine"
echo "kubectl get service -n grafana"
echo " installing sonarqube"
./sonarqube.sh
echo "HAPPY HACKING"
}


destroy()
{
figlet Deleting
echo "Have a Good Day:)"
echo "delete pod service and hpa"
echo "delete ns and all"
kubectl delete ns sai prometheus grafana
echo "Deleting sonarqube"
./delete.sh
}

scan()
{
figlet Scaning
./scan.sh
}

Checking(){
read -p "application deatils : " enter
$enter   
}

mysys(){
./doc-pro-gra.sh
}

end(){
exit
}

while :
do
figlet SAG Task
echo " "
echo "Creating Infrasture : 1 "
echo " "
echo "Deleting Infrasture : 2 "
echo " "
echo "Security scan : 3 "
echo " "
echo "Checking details about application status : 4 "
echo " "
echo "Local meachine with p8s grafana : 5 "
echo " "
echo "exit() : 6 "
echo " "
read -p "value : " my
echo " "
  if [[ $my -eq 1 ]]
  then
    createing
    echo "running"
  elif (($my==2))
  then
  echo "enter the password : "
  read password

     if [ $password == "c2Fp" ]; then
	destroy
     echo "Hello"

     else

     echo "Wrong password"
     fi
  elif (($my==3))
  then
    scan
    echo "Open Ports form the given ip "
  elif (($my==4))
  then
    Checking
    echo "not "
  elif (($my==5))
  then
  mysys
  echo "Local machine scanning "
  elif (($my==6))
  then
    end
    echo "not "
  fi
done
