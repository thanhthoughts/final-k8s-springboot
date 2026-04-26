pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/thanhthoughts/final-k8s-springboot.git'
            }
        }

        stage('Build Jar') {
            steps {
                echo 'Build command: mvn clean package -DskipTests'
                echo 'This stage represents building the Spring Boot JAR file.'
                sh 'ls -la'
            }
        }

        stage('Push Jar to Nexus') {
            steps {
                echo 'Push command: mvn deploy -DskipTests'
                echo 'Nexus URL: http://nexus-service:8081/repository/maven-releases/'
                echo 'This stage represents pushing the JAR artifact to Nexus.'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Docker command: docker build -t springboot-mysql-app:1.0 .'
                echo 'This stage represents building the Docker image.'
            }
        }

        stage('Deploy Webapp to Kubernetes') {
            steps {
                echo 'Kubernetes command: kubectl apply -f k8s/webapp-deployment.yaml'
                echo 'Kubernetes command: kubectl apply -f k8s/webapp-service.yaml'
                echo 'This stage represents deploying the webapp to Kubernetes.'
            }
        }
    }

    post {
        success {
            echo 'Pipeline proof completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check console output.'
        }
    }
}