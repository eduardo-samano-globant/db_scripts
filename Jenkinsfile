pipeline {
  agent any
  parameters {
        string(defaultValue:'', description: 'SCRIPT PATH', name: 'SCRIPT')
    }
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
            env | grep password
            mysql -u "$(vault read -field=username data-eng/vivid-master-rw)" -p"$(vault read -field=password data-eng/vivid-master-rw)" -h 10.231.8.25 -e "SELECT * FROM sys.sys_config";
            ls -l
            chmod +x -R .
            ./${params.SCRIPT}
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
