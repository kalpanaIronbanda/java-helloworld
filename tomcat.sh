#!/bin/bash
sudo yum update -y
sudo yum install java -y
cd /opt
sudo wget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.0-M6/bin/apache-tomcat-11.0.0-M6-windows-x64.zip
unzip apache-tomcat-11.0.0-M6-windows-x64.zip
sudo rm -f *.zip
sudo ln -s /opt/apache-tomcat-11.0.0-M6/ tomcat
cd tomcat/bin/
sudo chmod 755 *


