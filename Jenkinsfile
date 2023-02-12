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
    }  
 }

