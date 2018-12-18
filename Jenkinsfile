pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building..'
        withCredentials(bindings: [string(credentialsId: 'VT', variable: 'VAULTTOKEN')]) {
          sh /* CORRECT */ '''
            set +x
            echo $VAULTTOKEN
            export 'VAULT_TOKEN'=$VAULTTOKEN
            ENV
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
