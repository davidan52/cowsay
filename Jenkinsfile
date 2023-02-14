#!groovy

pipeline {
   agent any
  stages {
     stage('Build') {
       steps {
	sh 'ls'
	sh 'pwd'
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
    stage('Deploy'){
     steps {
	withCredentials([file(credentialsId: 'daniel-pem', variable: 'FILE')]){
		sh 'scp -i $FILE -o StrictHostKeyChecking=no ./cowsay-run.sh ubuntu@52.49.196.207:'
		sh 'ssh -i $FILE -o StrictHostKeyChecking=no ubuntu@52.49.196.207 ./cowsay-run.sh'

		
	
                
}
}
}
    stage('Testing'){
     steps {
	sh 'curl http://52.49.196.207:3010'
}
}
}
 post {
       always {
	sh 'echo done '
      }
   }
}


