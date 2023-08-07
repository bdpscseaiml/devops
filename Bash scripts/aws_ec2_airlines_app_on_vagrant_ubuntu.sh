#!/bin/bash
# Commands to run on aws instance to build the 'Airlines' app
sudo apt-get update
sudo apt-get install default-jdk default-jdk-headless default-jre default-jre-headless -y
sudo apt-get install maven -y
sudo apt-get install tomcat9 tomcat9-admin -y
sudo apt-get install mariadb-server -y


### MARIADB COMMANDS - START #########

sudo mysql -u root -e 'CREATE DATABASE airlines;'
sudo mysql -u root -e 'CREATE USER "airuser"@"%" IDENTIFIED BY "password";'
sudo mysql -u root -e 'GRANT ALL ON airlines.* TO "airuser"@"%";'
sudo mysql -u root -e 'FLUSH PRIVILEGES;'
sudo mysql -u root -e 'exit'

### MARIADB COMMANDS - END #########

git clone https://github.com/bdpscseaiml/airlines.git
cd airlines
sudo mysql -u airuser -ppassword airlines < sample_data.sql

# mvn install
# mvn spring-boot:run


#### Commands to run the app in external Tomcat - START #####

sudo mvn clean package 
sudo mv /var/lib/tomcat9/webapps/ROOT /var/lib/tomcat9/webapps/ROOT_BACKUP 
sudo cp /home/ubuntu/airlines/target/airlines.war /var/lib/tomcat9/webapps/ROOT.war 
sudo service tomcat9 restart

#### Commands to run the app in external Tomcat - END #####
