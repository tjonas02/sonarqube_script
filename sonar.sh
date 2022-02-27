#!/bin/bash
#Installation of sonarqube on Centos7
#Author: Jonas
#Date 2/26/2022
echo "sonarqube installation in progress"
sleep 3
#downloading the tools I needs.

sudo yum install java-11-openjdk-deve1 wget unzip net-tools -yum

cd /opt
#downloading the sonarqube image
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sleep 3
sudo unzip /opt/sonarqube-9.3.0.51899.zip
#changing the owner of sonarqube to vagrant
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start
echo "Installation was successful"
echo "system starting Sonarqube now ..."
echo "Below is the IP address:"
sudo ifconfig | grep 192. |awk '{print $2}'

#this command will open the browser directly
http://$(ifconfig eth1|head -2|tail -1|awk '{print $2}'):9000
#in case the server have the firewall enable, run the command below:
#sudo firewall-cmd --permanent --add-port=9000/tcp
#sudo firewall-cmd --reload


