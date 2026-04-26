pipeline {
    agent {
        docker {
            image 'maven:3.9-eclipse-temurin-17'
            args '-v /root/.m2:/root/.m2'
        }
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
                echo 'This stage would push the built JAR to Nexus repository.'
                echo 'Nexus URL: http://nexus-service:8081/repository/maven-releases/'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'This stage would build the Docker image for the Spring Boot app.'
            }
        }

        stage('Deploy Webapp to Kubernetes') {
            steps {
                echo 'This stage would deploy the webapp to Kubernetes using kubectl apply.'
            }
        }
    }
}