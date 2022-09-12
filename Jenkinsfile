pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        docker {
          image 'maven:3.8-jdk-11'
        }
      }
      steps {
        sh 'mvn clean package'
      }
    }
  }
}
