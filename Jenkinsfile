#!groovy

pipeline {
   agent none
  stages {
     stage('Docker Build') {
    	agent any
       steps {
      	sh 'docker build -t hezidev/cowsay-daniel:1.1 .'
	}
     stage('Docker run') {
       agent any 
      steps {
       sh 'docker run --name cowsay hezidev/cowsay-daniel:1.1'
      }
    }  
 }
}
}

