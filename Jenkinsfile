pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'dockerlogin' // Replace with your Docker Hub credentials ID in Jenkins
        DOCKER_REPO = "ratna123/tag" // Replace with your Docker Hub username and image name
        DOCKER_TAG = "123" // Replace with the desired image tag
        GIT_REPO_URL = "https://github.com/Pprashu-63/Pkagupati.git" // Replace with your GitHub repository URL
        DOCKERFILE_PATH = "Dockerfile" // Replace with the path to your Dockerfile in the repository
        // DOCKER_REPO_URL = "https://hub.docker.com/repository/docker/prashanth63/newrepo/general"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: GIT_REPO_URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage // Define dockerImage variable in this scope
                    dockerImage = docker.build("${DOCKER_REPO}:${DOCKER_TAG}", "-f ${DOCKERFILE_PATH} .")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    def dockerImage // Define dockerImage variable in this scope
                    dockerImage = docker.image("${DOCKER_REPO}:${DOCKER_TAG}") // Retrieve the existing Docker image
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        dockerImage.push()
                    }
                }
            }
        }

        
    }
}