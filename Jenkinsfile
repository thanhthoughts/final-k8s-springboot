pipeline {
    agent any

    environment {
        APP_NAME = "springboot-mysql-app"
        IMAGE_NAME = "springboot-mysql-app:1.0"
        NEXUS_URL = "http://nexus-service:8081"
        KUBE_NAMESPACE = "default"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/thanhthoughts/final-k8s-springboot.git'
            }
        }

        stage('Build Jar') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Push Jar to Nexus') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'nexus-credentials',
                    usernameVariable: 'NEXUS_USER',
                    passwordVariable: 'NEXUS_PASS'
                )]) {
                    sh "mvn deploy -DskipTests -DaltDeploymentRepository=nexus::default::${NEXUS_URL}/repository/maven-releases/"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Deploy Webapp to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/webapp-deployment.yaml'
                sh 'kubectl apply -f k8s/webapp-service.yaml'
                sh 'kubectl rollout status deployment/webapp-deployment --namespace ${KUBE_NAMESPACE}'
            }
        }
    }
}
