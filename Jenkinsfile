#!groovy

pipeline {
   agent any
  stages {
     stage('Docker Build') {
       steps {
      	sh 'docker build -t hezidev/cowsay-daniel:1.1 .'
	}
}
     stage('Docker run') {
      steps {
       sh 'docker run -d --name cowsayDaniel hezidev/cowsay-daniel:1.1'
       sh 'curl http://localhost:8080'
      }
    }  
 }
 post {
       always {
       sh 'docker rm -f cowsayDaniel || true'
      }
   }
}

