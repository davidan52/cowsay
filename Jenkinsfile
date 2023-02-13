#!groovy

pipeline {
   agent any
  stages {
     stage('Docker Build') {
       steps {
      	sh 'docker build -t hezidev/cowsay-daniel:1.1 .'
	}
}
    stage('Docker Push') { 
	steps {
	sh 'docker push 644435390668.dkr.ecr.eu-west-1.amazonaws.com/cowsay:daniela'  
    }  
}
}
 post {
       always {
       sh 'docker rm -f cowsayDaniel || true'
      }
   }
}


