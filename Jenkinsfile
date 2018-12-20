#!/usr/bin/env groovy

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
        MYSQL_PWD      = vault path: 'data-eng/vivid-master-rw', key: 'password', vaultUrl: 'http://10.231.8.25:8200', credentialsId: 'VAULTTOKEN'
  }
  parameters {
        string(defaultValue:'', description: 'SCRIPT PATH', name: 'SCRIPT')
        activeChoiceParam('file') {
          description('Select your Sctipt file')
          choiceType('RADIO')
          groovyScript {
            script("return['aaa','bbb']")
            fallbackScript('return ["error"]')
          }
        }
    }
  stages {
    stage('Run script') {
      steps {
        echo 'Running..'
        wrap([$class: 'MaskPasswordsBuildWrapper', varPasswordPairs: [[password: env['DB_USERNAME'], var: 'SECRET'], [password: env['MYSQL_PWD'], var: 'SECRET']]]) {
          sh """#!/bin/bash -xe
            env
            chmod +x -R .
            cat ${params.SCRIPT}
            ./${params.SCRIPT}
           """
        }
      }
    }
  }
}
