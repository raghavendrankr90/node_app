
# Notes

brew tap caskroom/cask
Installing Docker for Mac
brew cask install/upgrade virtualbox
brew install kubectl
brew cask install minikube
`(alternatively can be done using latest binary file [ curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 \
    && chmod +x minikube
] )`
minikube start
Tip: Use 'minikube start -p `name`' to create a new cluster, or 'minikube delete' to delete this one.
kubectl api-versions

## Setting up node environment

brew install node
node -v
npm -v
brew upgrade node

Creating a simple hello-world node app:
mkdir Node_App
cd Node_App
npm init `follow the prompts and create package.json`
index.js is the source file which triggers the actual implementation of the what should happen.
npm install
npm run start
access the application on port you started the app on`3000`

## Making the application Docker Ready

Write the Dockerfile  for the application as applicable
docker build -t "node_app" .
docker run -d -p 4200:3000 node_app (access the app on port mapped i.e., 4200)
docker stop `conatiner_id`
docker tag node_app raghavendrankr/node_app:v1
docker login —username=raghavendrankr —password=plaintext or cat ~/mypass.txt | docker login —username=raghavendrankr —password-stdin
docker push raghavendrankr/node_app:v1

## Writing deployment template for K8s

deployment.yml
kubectl create -f deployment.yml --save-config
kubectl get deployments
kubectl get pods
kubectl logs `pod_name`
kubectl expose deployment `node-hello-world` --type="LoadBalancer" —name=my-node-app  `deployment name is under metadata name of deployment.yml or prefix of the pod common for pods with more than 1 replica` `—name: group as one all pods for that deployment set`
kubectl get service `service_name` `service name is the name from above i.e., my-node-app` `take external IP from the o/p to access the service using port mapped`
kubectl get replicasets `to find the no. of replicas`
kubectl describe services `to list all the services, take LoadBalancer Ingress curl http://<external-ip>:<port>`
As we are using cutom kubernetes cluster `like minkube, kubeadm` there is no load-balancer integrated unlike AWS or GoogleCloud.
minikube service node-hello-world `to open service in your default browser`
We can manually form the url from taking IP`Endpoints:` from kubectl describe service and port `NodePort:`

## Cleaning up

kubectl get service
kubectl delete services `node-hello-world`
kubectl get deployments
kubectl delete deployment `node-hello-world`

minikube status `host: Running, kubelet: Running, apiserver: Running, kubectl: Correctly Configured: pointing to minikube-vm at 192.168.99.100`
minikube dashboard (kubernets GUI)
minikube stop
minikube delete
rm -rf ~/minikube ~/.kube
brew uninstall kubectl
brew cask uninstall docker virtualmachine minikube
