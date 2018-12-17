
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                withCredentials([string(credentialsId: 'local-vault', variable: 'myvar')]) {
                   echo $myvar
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
