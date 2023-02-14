aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 644435390668.dkr.ecr.eu-west-1.amazonaws.com
docker run -d -p $PORT:8080 --name cowsay-daniel --rm 644435390668.dkr.ecr.eu-west-1.amazonaws.com/cowsay:daniel.1
sleep 10
docker ps
