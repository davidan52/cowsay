#!groovy

pipeline {
   agent any
  stages {
     stage('Build') {
       steps {
      	sh 'docker build -t cowsay:daniel.1 .'
	sh 'docker tag cowsay:daniel.1 644435390668.dkr.ecr.eu-west-1.amazonaws.com/cowsay:daniel.1'
	}
}
    stage('Push') {
      steps {
	withAWS(credentials: 'daniel-aws', region: 'eu-west-1'){
	sh 'docker push 644435390668.dkr.ecr.eu-west-1.amazonaws.com/cowsay:daniel.1'

    }  
}
}
    stage('Deploy testing'){
     steps {
	withCredentials([file(credentialsId: 'daniel-pem', variable: 'FILE')]){
		sh 'ssh -i $FILE -o StrictHostKeyChecking=no ubuntu@52.49.196.207'
		sh 'aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 644435390668.dkr.ecr.eu-west-1.amazonaws.com'
		sh 'docker run 644435390668.dkr.ecr.eu-west-1.amazonaws.com/cowsay:daniel.1'
		sh 'sleep 10'
		sh 'docker ps'
       
}
}
}
}
 post {
       always {
	sh 'echo done '
      }
   }
}


