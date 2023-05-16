#!/bin/bash
sudo su -
yum update -y
yum install java -y
cd /opt
swget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.0-M6/bin/apache-tomcat-11.0.0-M6-windows-x64.zip
unzip apache-tomcat-11.0.0-M6-windows-x64.zip
rm -f *.zip
ln -s /opt/apache-tomcat-11.0.0-M6/ tomcat
cd tomcat/bin/
chmod 755 *.sh


