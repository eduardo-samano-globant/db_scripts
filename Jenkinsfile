pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building..'
        withCredentials(bindings: [string(credentialsId: 'VT', variable: 'VAULTTOKEN')]) {
          sh /* CORRECT */ '''
            set -x
            echo $VAULTTOKEN
            export 'VAULT_TOKEN'=$VAULTTOKEN
            env
            vault status
            export username=$(vault read -field=username data-eng/vivid-master-rw)
            export password=$(vault read -field=password data-eng/vivid-master-rw)
            env | grep username
            env | grep username
            ls -l
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
