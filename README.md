## test-project
#TF
#
#Faisee-Pro:work-dir neerajnayan$ cat variables.tfvars 
#region = "us-east-2"
#key_name = "test"
#k8s_ami = "ami-0782e9ee97725263d"
#shared_credentials_file = "/Users/neerajnayan/work-dir/.creds"
#inst_type = "t2.micro"
#####################
#
#variable "region" {}
#variable "key_name" {}
#variable "k8s_ami" {}
#variable "shared_credentials_file" {}
#variable "inst_type" {}
#
#provider "aws" {
#region = "${var.region}"
#shared_credentials_file = "${var.shared_credentials_file}"
#}
#
#resource "aws_security_group" "demo-security-group" {
#name = "Demo123"
#description = "dvdvrb"
#
#ingress {
#from_port = 0
#to_port = 65535
#protocol = "tcp"
#cidr_blocks = ["0.0.0.0/0"]
#}
#
#egress {
#from_port = 0
#to_port = 65535
#protocol = "tcp"
#cidr_blocks = ["0.0.0.0/0"]
#}
#}
#
#resource "aws_instance" "master01" {
#key_name = "${var.key_name}"
#ami = "${var.k8s_ami}"
#instance_type = "t2.small"
#security_groups = ["${aws_security_group.demo-security-group.name}"]
#tags {
#Name = "Mast-01"
#}
#}
#
#resource "aws_instance" "worker01" {
#key_name = "${var.key_name}"
#ami = "${var.k8s_ami}"
#instance_type = "${var.inst_type}"
#security_groups = ["${aws_security_group.demo-security-group.name}"]
#tags {
#Name = "worker-01"
#}
#}
#
#######
#Faisee-Pro:work-dir neerajnayan$ cat .creds 
#[default]
#aws_access_key_id = AKIAIN6LKME72K6JH4SQ
#aws_secret_access_key = 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
#
#
#
#5. Create a new repository in git
#
# 152  sudo apt-get remove git
#  154  sudo apt-get install git
#  155  echo "# test-project" >> README.md
#  156  ls -ltr
#  157  cat README.md 
#  158  echo "# test-project" > README.md
#  159  cat README.md 
#  160  git init
#  161  git add README.md
#  162  git commit -m "first commit"
#  163  git remote add origin https://github.com/neerajnayan123/test-project.git
#  164  git push -u origin master
#  166  git commit .
#  169  git add Dockerfile 
#  170  git add html
#  171  git add test.sh 
#  172  it commit -m "second commit"
#  174  git push -u origin master
#
#
#5. Install jenkins
#
#https://linuxize.com/post/how-to-install-jenkins-on-ubuntu-18-04/
#
#    1  sudo -i
#    2  clear
#    3  sudo apt update
#    8  sudo apt install openjdk-8-jdk
#    9  wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
#   10  sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
#   11  sudo apt update
#   12  sudo apt install jenkins
#   13  sudo systemctl status jenkins
#   14  sudo ufw allow 8080
#   15  sudo ufw status
#   16  cat /var/lib/jenkins/secrets/initialAdminPassword
#   17  sudo cat /var/lib/jenkins/secrets/initialAdminPassword
#    18 Use ip:8080 on the browser and setup jenkins
#    19 Install dockers
#     20  
#
#5. Create kubernetes Cluster
#
#Create MasterNode
#
#
#SSH to the masternode
#sudo -i
#apt-get update && apt-get upgrade -y
#apt-get install -y docker.io
#vim /etc/apt/sources.list.d/kubernetes.list and add the following line
#deb http://apt.kubernetes.io/ kubernetes-xenial main
#
#curl -o apt-key.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
#apt-key add apt-key.gpg
#apt-get update
#apt-get install -y kubeadm=1.12.1-00 kubelet=1.12.1-00 kubectl=1.12.1-00
#wget https://tinyurl.com/yb4xturm -O rbac-kdd.yaml
#wget https://tinyurl.com/y8lvqc9g -O calico.yaml
#cat calico.yaml and make a note of CALICO_IPV4POOL_CIDR
#kubeadm init --pod-network-cidr 192.168.0.0/16 --apiserver-advertise-address <private-ip of the instance>
#Save the following similar output
#kubeadm join 172.31.18.238:6443 --token et7rmb.bdm9vptbtgxi7k0w --discovery-token-ca-cert-hash sha256:ca8e435a80742bec0f3dbd62034b43094b9d529263e90380b03196a900ea69d8
#Login as a non-root user, say ubuntu and 
#mkdir -p $HOME/.kube
#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#sudo chown $(id -u):$(id -g) $HOME/.kube/config
#less .kube/config
#sudo cp /root/rbac-kdd.yaml .
#sudo cp /root/calico.yaml .
#kubectl apply -f rbac-kdd.yaml
#kubectl apply -f calico.yaml
#source <(kubectl completion bash)
#echo "source <(kubectl completion bash)" >> ~/.bashrc
#Test your master by  kubectl get nodes
#
#
#Add WorkerNode
#
#SSH to the workernode
#sudo -i
#apt-get update && apt-get upgrade -y
#apt-get install -y docker.io
#vim /etc/apt/sources.list.d/kubernetes.list and add the following line
#deb http://apt.kubernetes.io/ kubernetes-xenial main
#Add a GPG key for the packages
#curl -o apt-key.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
#      6. apt-key add apt-key.gpg
#      7. apt-get update
#      8. apt-get install -y kubeadm=1.12.1-00 kubelet=1.12.1-00 kubectl=1.12.1-00
#      9. kubeadm join 172.31.18.238:6443 --token et7rmb.bdm9vptbtgxi7k0w --discovery-token-ca-cert-hash sha256:ca8e435a80742bec0f3dbd62034b43094b9d529263e90380b03196a900ea69d8     
# 
#C. Deploy the App to Kubernetes
#
## git clone https://github.com/neerajnayan123/test-project
## docker build . -t test-project
## docker images
## docker run -d -p80:80 --name test-project test-project
## docker tag test-project neerajnayan/test-project
## docker login -u neerajnayan
## docker push neerajnayan/test-project
## kubectl create deployment test-project --image neerajnayan/test-project
## kubectl get pods
#kubectl expose deployment hellowhale --type=NodePort --name=hello --port=80
#
#
#6. Install github plugin in jenkins
#
#Log into jenkins and click on Manage Jenkins (image below)
#
#      2. Click on Manage Plugins
#      
#      3. Click on available tab (note the Filter search box) 
#
#
#
#      3. Search for git in the filter box and look for GitHub Integration. Check the checkbox
#
#
#        4. Click on download now and restart
#
#
#
#
#        5. Restart jenkins as follows
#
#
#
#
#         6. Go to jenkins dashboard
#
#
#
#Click on Manage Jenkins and Configure System
#
#
#
#
#
#  
#
#7. Create a webhook in git to trigger a build on jenkins
#
#8. Install the kubernetes plug into jenkins and do an automated deploy as a part of post build step
#
#For Build
#
#IMAGE_NAME="neerajnayan/test-project:${BUILD_NUMBER}"
#sudo docker build . -t $IMAGE_NAME
#sudo docker login -u neerajnayan -p ${DOCKER_HUB}
#sudo docker push $IMAGE_NAME
#
#For Deploy
#IMAGE_NAME="neerajnayan/test-project:${BUILD_NUMBER}"
#kubectl set image deployment/test-project test-project=$IMAGE_NAME -n test-project
#
#
#For nopwd for sudo on ubuntu 
#visudo
#aychedee ALL=(ALL) NOPASSWD:ALL
#
#
#
