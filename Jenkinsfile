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
				script {
					if (env.BRANCH_NAME == 'main') {
						echo 'Hello from main branch'
						env.PORT = 80
						}
					else if (env.BRANCH_NAME == 'staging'){
						echo 'Hello from staging branch'
						env.PORT = 3000
				}
					else {
						echo 'Hello from feature branch'
						Utils.markStageSkippedForConditional('Deploy')
					}	 
			}
				withCredentials([file(credentialsId: 'daniel-pem', variable: 'FILE')]){
						sh 'scp -i $FILE -o StrictHostKeyChecking=no ./cowsay-run.sh ubuntu@52.214.125.146:'
						sh 'ssh -i $FILE -o StrictHostKeyChecking=no ubuntu@52.214.125.146 "export PORT=${PORT}; ./cowsay-run.sh"'
			
					}
			}
		}
		stage('Testing'){
		steps {
		sh 'curl http://52.214.125.146:${PORT}'
			}
		}
	}
	post {
		always {
		withCredentials([file(credentialsId: 'daniel-pem', variable: 'FILE')]){
		sh 'ssh -i $FILE -o StrictHostKeyChecking=no ubuntu@52.214.125.146 command docker stop cowsay-daniel' 
		sh 'echo done '
			}
		}
	}
}


