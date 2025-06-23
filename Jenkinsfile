pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/IT20272654/CI-CD-Pipeline-with-Jenkins-Docker-DockerHub-Integration'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jobrecruitment_client_v2 .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    sh 'docker tag jobrecruitment_client_v2 $DOCKER_USERNAME/jobrecruitment_client_v2:latest'
                    sh 'docker push $DOCKER_USERNAME/jobrecruitment_client_v2:latest'
                }
            }
        }
    }
}
