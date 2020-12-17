# AWS ESK Demo 
 
From acloudguru EKS 101

Create an IAM role - k8
And assign it an Admin Policy

Install aws cli + eksctl from here

https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html

eksctl create cluster --name dev-cluster --version 1.16 --region us-east-1 --nodegroup-name standard-workers  --node-type t3.micro --nodes 3 --nodes-min 1 --nodes-max 4 --managed --profile k8

# This will take about 10 mins - it will create/run a cloudformation script

eksctl get cluster --profile k8

# Should return the name of your cluster ... which you can use in subsequent cmds.

# Configure your eks config to use kubectl
aws eks update-kubeconfig --name dev-cluster --region us-east-1 --profile k8


# create the service (will give you the load blancer address
kubectl apply -f ./nginx-svc.yam
# create the worker EC2s
kubectl apply -f ./nginx-deployment.yaml

# Wait a minute or so and you can access your cluster on port 80 through the loadbalancer address

# If that all looks OK - go to your EC2  console and terminate a coule of the instsances that EKS created
# You should see it automatically create some new ones to relace them

# Thats it - next steps - create some more intereting docker images instead of basic nginx


#  Delete all when finished /// and make sure you terminate any ec2 instances created
#  eksctl delete cluster dev-cluster --profile k8
