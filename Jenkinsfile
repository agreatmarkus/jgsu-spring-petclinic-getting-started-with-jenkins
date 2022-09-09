pipeline {
  agent { dockerfile true }
  stages {
    stage('Version check') {
      steps {
        sh 'mvn --version'
      }
    }
    stage('Build') {
      steps {
        sh 'mvn clean package'
      }
    }
  }
}
