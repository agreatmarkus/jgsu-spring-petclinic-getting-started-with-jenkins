pipeline {
  agent { docker { image 'maven:alpine' } }
  stages {
    stage('Log version info') {
      steps {
        sh 'mvn --version'
      }
    }
    stage('Build') {
      steps {
        sh 'mvn clean install'
      }
    }
  }
}
