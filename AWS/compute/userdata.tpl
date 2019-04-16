#! /bin/bash

#nginx install
# sudo yum update -y
# sudo yum install -y nginx
# sudo service nginx start

#docker install
sudo yum install -y docker
sudo groupadd docker
sudo usermod -aG docker $USER
service docker start

#git isntall
sudo yum install -y git

#container setup
git clone https://github.com/FortunexFortune/React_Movie_Search.git
cd React_Movie_Search
sudo docker build -t fortunexfortune/moviesearchapi .
sudo docker run --name moviesearchapi -p 3000:3000 -d fortunexfortune/moviesearchapi:latest