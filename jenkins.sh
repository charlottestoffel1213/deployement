#!/bin/bash

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INSTALLATION JENKINS<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update

sudo apt-get install jenkins default-jre

chemin=`type -p java`
echo "PATH=$chemin:$PATH" >  ~/.bashrc

source /etc/bash.bashrc

service jenkins restart
