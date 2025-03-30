pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'staging', url: 'https://github.com/anilkushma/myapp.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t ramboo2023/myapp:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh 'docker push ramboo2023/myapp:latest'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose down'
                sh 'docker-compose up -d'
            }
        }
    }
}

