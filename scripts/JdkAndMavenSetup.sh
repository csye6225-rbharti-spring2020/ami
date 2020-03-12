#!/bin/bash

sudo apt-get update -y
sudo apt --fix-broken install

#JAVA SETUP
sudo apt-get install openjdk-11-jre-headless -y
sudo apt install openjdk-11-jdk-headless -y
echo "export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))" | sudo tee -a /etc/profile

#import profile
source /etc/profile

#export path
echo "export PATH=$PATH:$JAVA_HOME/bin" | sudo tee -a /etc/profile
echo "export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar" | sudo tee -a /etc/profile

#import updated profile
source /etc/profile

#installing all the required java certificates
sudo apt-get install ca-certificates-java

#install maven
sudo apt-get install maven -y