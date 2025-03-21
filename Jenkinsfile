pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'git@github.com:Vaishnavigowda55/DEVOPS.git'
            }
        }

        stage('Build & Run Docker Container') {
            steps {
                sh 'docker build -t my-app:latest .'
                sh 'docker run -d -p 5000:5000 --name my-app-container my-app:latest'
            }
        }
    }
}
