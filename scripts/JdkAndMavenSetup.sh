#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt --fix-broken install

#JAVA SETUP
sudo apt install default-jre -y
sudo apt install default-jdk -y
sudo update-alternatives --config java -y
java --version
echo "export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))" | sudo tee -a /etc/profile

#import profile
source /etc/profile

#export path
echo "export PATH=$PATH:$JAVA_HOME/bin" | sudo tee -a /etc/profile
echo "export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar" | sudo tee -a /etc/profile

#import updated profile
source /etc/profile

#install maven
sudo apt update -y
sudo apt install maven -y

mvn --version