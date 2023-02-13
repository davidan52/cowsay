#!groovy

pipeline {
   agent any
  stages {
     stage('Docker Build') {
       steps {
      	sh 'docker build -t hezidev/cowsay-daniel:1.1 .'
	}
}
      
    }  
 post {
       always {
       sh 'docker rm -f cowsayDaniel || true'
      }
   }
}

