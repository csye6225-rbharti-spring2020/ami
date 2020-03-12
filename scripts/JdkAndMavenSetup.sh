#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt --fix-broken install

#JAVA SETUP
sudo add-apt-repository ppa:linuxuprising/java -y
sudo apt update -y
sudo apt install oracle-java11-installer -y
sudo apt install oracle-java11-set-default -y
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
cd /usr/local
wget https://www-eu.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
sudo tar xzf apache-maven-3.6.0-bin.tar.gz
sudo ln -s apache-maven-3.6.0 apache-maven

#import profile
source /etc/profile

#export path
sudo echo "export M2_HOME=/usr/local/apache-maven" | sudo tee -a /etc/profile
sudo echo 'export MAVEN_HOME=/usr/local/apache-maven' | sudo tee -a /etc/profile
echo "export PATH=${M2_HOME}/bin:${PATH}" | sudo tee -a /etc/profile

#import updated profile
source /etc/profile

mvn -version

#removing the tar file
rm -f apache-maven-3.6.0-bin.tar.gz