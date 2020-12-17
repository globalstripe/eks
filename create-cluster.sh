 eksctl create cluster --name dev-cluster --version 1.16 --region us-east-1 --nodegroup-name standard-workers  --node-type t3.micro --nodes 3 --nodes-min 1 --nodes-max 4 --managed --profile k8

eksctl get cluster --profile k8

aws eks update-kubeconfig --name dev-cluster --region us-east-1 --profile k8

# create the service (will give you the load blancer address
kubectl apply -f ./nginx-svc.yam
# create the worker EC2s
kubectl apply -f ./nginx-deployment.yaml





#  Delete all when finished /// and make sure you terminate any ec2 instances created
#  eksctl delete cluster dev-cluster --profile k8
