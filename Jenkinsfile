pipeline {
    agent any

    environment {
        // שם התמונה שתיווצר ותידחף ל-Docker Hub
        DOCKER_IMAGE = 'oren1984/jenkins-docker-demo:latest'
        // מזהה אישורי Docker Hub שהגדרת ב-Jenkins
        DOCKER_HUB_CREDENTIALS = 'docker-hub-creds'
    }

        stage('Docker Build') {
            steps {
                script {
                    // בניית תמונת Docker לפי Dockerfile
                    dockerImage = docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('List Docker Images') {
            steps {
                // הצגת כל תמונות Docker ב-Agent (לבדיקת הבנייה)
                sh 'docker images'
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // התחברות ל-Docker Hub עם האישורים ודחיפת התמונה
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
