
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                withCredentials([string(credentialsId: 'ROOTTOKEN', variable: 'VAULTTOKEN')]) {
                    echo 'Testing token'
                    echo '$VAULTTOKEN'
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
