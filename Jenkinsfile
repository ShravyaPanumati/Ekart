pipeline {
    agent any
    tools{
        maven 'maven3'
        jdk 'jdk17'
    }
    environment{
        Scanner_Home= tool "sonar-scanner"
    }
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main' , url: 'https://github.com/ShravyaPanumati/ShoppingCartApplication-DevOps.git'
            }
        }
        stage('Compiling the Code') {
            steps {
                sh "mvn compile"
            }
        }
        stage('Unit Test') {
            steps {
                sh "mvn test -DskipTests=true"
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-scanner') {
                    sh '''$Scanner_Home/bin/sonar-scanner -Dsonar.projectKey=ShoppingCart -Dsonar.projectName=ShoppingCart \
                    -Dsonar.java.binaries=. '''
    
                }
                
            }
        }
       stage('OWASP Dependency Check') {
            steps {
                dependencyCheck additionalArguments: ' --scan ./', odcInstallation: 'DC'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        stage('Build') {
            steps {
                sh "mvn package -DskipTests=true"
            }
        }
        stage('Deploy to Nexus') {
            steps {
               withMaven(globalMavenSettingsConfig: 'global-maven', jdk: 'jdk17', maven: 'maven3', mavenSettingsConfig: '', traceability: true) {
                   sh "mvn deploy -DskipTests=true"
               }
            }
        }
       stage('Build and Tag Docker Image') { 
            steps {                
                script { 
                    withDockerRegistry(credentialsId: 'docker-cred') {                        
                        sh 'docker build -t shravyapanumati/shoppingcart:latest -f docker/Dockerfile .' 
                    }                
                    
                } 
            }        
       }
       stage('Trivy Image Scan') { 
            steps {                
                sh 'trivy image shravyapanumati/shoppingcart:latest > trivy_report.txt' 
            }        
        } 
        stage('Push Docker Image') { 
            steps {                
                script { 
                    withDockerRegistry(credentialsId: 'docker-cred') {                        
                        sh 'docker push shravyapanumati/shoppingcart:latest' 
                    }                
                } 
            }        
            
        }
        stage('Kubernetes Deployment') { 
            steps {   
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8-token', namespace: 'shoppingcart', restrictKubeConfigAccess: false, serverUrl: 'https://172.31.25.173:6443') {
                    sh 'kubectl apply -f deploymentservice.yml -n shoppingcart'                    
                    sh 'kubectl get svc -n shoppingcart' 
                }            
                
            } 
        }         
    
    }
}
