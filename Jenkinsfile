pipeline {
  agent {
    kubernetes {
      label 'jenkins-mysql-percona'
      idleMinutes 10
      yamlFile 'jenkins/kubernetes/build-pod.yaml'
      defaultContainer 'jnlp'
    }
  }
  environment {
        DB_USERNAME    = vault path: 'data-eng/vivid-master-rw', key: 'username', vaultUrl: 'http://10.231.8.25:8200', credentialsId: 'VAULTTOKEN'
        DB_PASSWORD    = vault path: 'data-eng/vivid-master-rw', key: 'password', vaultUrl: 'http://10.231.8.25:8200', credentialsId: 'VAULTTOKEN'
  }
  parameters {
        string(defaultValue:'', description: 'SCRIPT PATH', name: 'SCRIPT')
    }
  stages {
    stage('Run script') {
      steps {
        echo 'Running..'
        withCredentials(bindings: [string(credentialsId: 'VT', variable: 'VAULTTOKEN')]) {
          sh """#!/bin/bash -xe
            echo \$VAULTTOKEN
            export 'VAULT_TOKEN'=\$VAULTTOKEN
            env
            vault status
            export username=\$(vault read -field=username data-eng/vivid-master-rw)
            export password=\$(vault read -field=password data-eng/vivid-master-rw)
            env | grep username
            env | grep password
            mysql -u "\$(vault read -field=username data-eng/vivid-master-rw)" -p"\$(vault read -field=password data-eng/vivid-master-rw)" -h 10.231.8.25 -e "SELECT * FROM sys.sys_config";
            ls -l
            chmod +x -R .
            cat ${params.SCRIPT}
            ./${params.SCRIPT}
          """
        }

      }
    }
  }
}
