#!/bin/bash

sudo apt-get update -y
sudo apt-get install ruby wget -y

cd /home/ubuntu

wget https://${bucketName}.s3.${region}.amazonaws.com/latest/install
chmod +x ./install

sudo ./install auto

sudo service codedeploy-agent start
sudo service codedeploy-agent status