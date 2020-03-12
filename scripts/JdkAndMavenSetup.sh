#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt --fix-broken install

#JAVA SETUP
sudo apt install software-properties-common apt-transport-https -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt install oracle-java8-installer -y
java -version
echo "export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))" | sudo tee -a /etc/profile

#import profile
source /etc/profile

#export path
echo "export PATH=$PATH:$JAVA_HOME/bin" | sudo tee -a /etc/profile
echo "export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar" | sudo tee -a /etc/profile

#import updated profile
source /etc/profile

#install maven
cd /opt/
wget http://www-eu.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
tar -xf apache-maven-3.5.3-bin.tar.gz
mv apache-maven-3.5.3/ apache-maven/

#import profile
source /etc/profile

#export path
sudo echo "export M2_HOME=/opt/apache-maven" | sudo tee -a /etc/profile
sudo echo 'export MAVEN_HOME=/opt/apache-maven' | sudo tee -a /etc/profile
echo "export PATH=${M2_HOME}/bin:${PATH}" | sudo tee -a /etc/profile

#import updated profile
source /etc/profile