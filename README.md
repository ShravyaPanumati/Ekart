# Shopping Cart Application DevOps

This project demonstrates the implementation of a CI/CD pipeline for a Shopping Cart Application using DevSecOps approach.

## **Process Overview**
- **Source Code Management**: Code changes are committed to Git, triggering the CI/CD pipeline.
- **Build and Test**:
  - Source code is assembled using Maven.
  - Unit tests are executed to ensure code reliability and functionality.
- **Code Quality Analysis**:
  - SonarQube performs a comprehensive code quality check.
  - Identifies and eliminates code vulnerabilities, enhancing security and maintainability.
- **Dependency Vulnerability Scanning**:
  - OWASP Dependency-Check scans for vulnerabilities in third-party components and libraries.
  - Ensures potential risks from dependencies are mitigated.
- **Artifact Packaging**:
  - Maven builds and packages the application and its dependencies into a distributable artifact.
- **Artifact Repository Management**:
  - Packaged artifacts are securely stored in Nexus Repository Manager for efficient build artifact management.
- **Containerization**:
  - A Docker image is created from the bundled artifact.
  - Aqua Trivy scans the Docker image for vulnerabilities to identify and resolve any security issues before deployment.
- **Deployment**:
  - The Docker image is deployed to an AWS Kubernetes cluster.
  - Cloud deployment ensures efficient and scalable application management.

## **Project Goals**
- Integrate **DevOps principles and tools** to develop a secure, continuously deployable cloud-based application.
- Demonstrate the effectiveness of **modern DevOps practices** in enhancing security, reliability, and scalability.

#Steps to Implement the Project
1. Setting Up Infrastructure on AWS
EC2 Instances:
Instances were provisioned for running critical components:
Jenkins
SonarQube
Nexus
Kubernetes Master and Worker Nodes
2. Jenkins Setup
Install Java:
```
sudo apt install openjdk-17-jre-headless -y
```
Install Jenkins:
```
sudo apt update
sudo apt install jenkins -y
```
Enable and Start Jenkins:
```
sudo systemctl enable jenkins
sudo systemctl start jenkins
```
Access Jenkins:
Use http://<public-ip>:8080.
Retrieve the initial admin password and set up Jenkins.
Install Docker in Jenkins:
```
sudo apt install docker.io -y
sudo chmod 666 /var/run/docker.sock
```
3. SonarQube Setup
Install Docker:
```
sudo apt install docker.io -y
```
Run SonarQube:
```
docker run -d --name sonarqube -p 9000:9000 sonarqube
```
Access SonarQube:

Use http://<public-ip>:9000.
Login with default credentials (admin/admin) and change the password.
4. Nexus Setup
Install Docker:
```
sudo apt install docker.io -y
```
Run Nexus:
```
docker run -d --name nexus3 -p 8081:8081 sonatype/nexus3
```
Access Nexus:

Use http://<public-ip>:8081.
Default credentials:
Username: admin
Password: From nexus-data/admin.password.
5. Configure Jenkins Plugins
Install required plugins:

SonarQube Scanner
Nexus Artifact Uploader
Docker Pipeline
Add Credentials:

SonarQube token.
DockerHub credentials.
Configure SonarQube Server in Jenkins:

Add SonarQube URL and token.
Pipeline Syntax:

Configure pipeline stages for building, testing, and pushing artifacts.
6. Kubernetes Setup
Install Docker on Master and Worker Nodes:
```
sudo apt install docker.io -y
sudo chmod 666 /var/run/docker.sock
```
Install Kubernetes Components:
```
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubeadm=1.28.1-1.1 kubelet=1.28.1-1.1 kubectl=1.28.1-1.1
```
Initialize Kubernetes Master Node:
```
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```
Configure Master Node:
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
Deploy Calico Networking:
```
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```
Join Worker Nodes:

Use the kubeadm join command with the token from the master node.
Deploy NGINX Ingress:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.49.0/deploy/static/provider/baremetal/deploy.yaml
```
7. Configure Kubernetes for Jenkins
Create Service Account and Role:

Assign roles to allow Jenkins access.
Generate Kubernetes Secrets:

Save the token for Jenkins integration.
Integrate Kubernetes in Jenkins Pipeline.

8. CI/CD Pipeline with Jenkins
Build and Push Docker Image:

Tag the image and push it to DockerHub.
Aqua Trivy Security Scan:

Install Aqua Trivy on Jenkins instance.
Deploy to Kubernetes:

Use Kubernetes manifests for deployment.
