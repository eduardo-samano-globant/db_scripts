
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                withCredentials([string(credentialsId: 'vault-token', variable: 'VAULTTOKEN')]) {
                   echo $VAULTTOKEN
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
