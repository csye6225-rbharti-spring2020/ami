#!/bin/bash

sudo apt-get update

sudo apt-get install ruby - y

sudo apt-get install wget -y

cd /home/ubuntu

wget https://${bucketName}.s3.${region}.amazonaws.com/latest/install

sudo chmod +x ./install

sudo ./install auto

sudo service codedeploy-agent start

sudo service codedeploy-agent status