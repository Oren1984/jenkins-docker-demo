pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'oren1984/jenkins-docker-demo:latest'
        DOCKER_HUB_CREDENTIALS = 'dockerhub-creds' // זה השם שהגדרת ב-Jenkins ב-Credentials
    }

    stages {
        stage('Docker Build') {
            steps {
                script {
                    dockerImage = docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
