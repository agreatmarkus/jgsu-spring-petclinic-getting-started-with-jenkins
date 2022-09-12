pipeline {
  agent none
  stages {
    stage('Build') {
      steps {
        sh 'mvn clean package'
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'targets/*.jar', fingerprint: true
    }
  }
}
