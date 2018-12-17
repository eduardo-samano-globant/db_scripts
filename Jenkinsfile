pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building..'
        withCredentials(bindings: [string(credentialsId: 'ROOTTOKEN', variable: 'VAULTTOKEN')]) {
          sh /* CORRECT */ '''
            set +x
            echo $VAULTTOKEN
          '''
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
