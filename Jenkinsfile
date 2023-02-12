#!groovy

pipeline {
   agent none
  stages {
     stage('Docker Build') {
    	agent any
       steps {
      	sh 'docker build -t hezidev/cowsay-daniel:1.1 .'
	}
}
     stage('Docker run') {
       agent any 
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

