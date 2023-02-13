#!groovy

pipeline {
   agent any
  stages {
     stage('Docker Build') {
       steps {
      	sh 'docker build -t cowsay-daniel:1.1 .'
	}
}
    stage('Docker Push') { 
	steps {
	sh 'docker push 644435390668.dkr.ecr.eu-west-1.amazonaws.com/cowsay-daniel:1.1'  
    }  
}
}
 post {
       always {
	sh 'docker images | grep cowsay-daniel'
      }
   }
}


