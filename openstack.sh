#!/bin/bash


echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>INSTALLATION OPENSTACK<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

## @ip statique : ifconfig :l'utiliser pour créer une @ip statique

echo ">>>>>>>>>>création ip statique <<<<<<<<<<<<<"
ifconfig eth0 192.168.2.203 netmask 255.255.255.0 up > 
systemctl restart network

OS=`sed -n 3p /etc/os-release | cut -d= -f2`

if [[ "$OS" -eq ubuntu ]]; then
	echo ">>>>>>>>>>Installation Openstack sur UBUNTU<<<<<<<<<<<<<"

	#devstack 
	sudo apt update
	sudo apt -y upgrade
	sudo apt -y dist-upgrade
	sudo reboot

	#add stackuser ??

	#download devstack
	su - stack
	sudo apt -y install git
	git clone https://git.openstack.org/openstack-dev/devstack
	
	cd devstack
	nano local.conf
	#change the local.conf ?

	cd devstack
	./stack.sh

	echo "
Vous pouvez maintenant acceder à Openstack via l'adresse : http://(host_ip_address)/dashboard"

	
elif [[ "$OS" -eq centos ]]; then
	echo ">>>>>>>>>>Installation Openstack sur CENTOS<<<<<<<<<<<<<"
	
	echo "==============Installation Configurations================"
	sudo su -
	systemctl stop firewalld
	systemctl disable firewalld
	#sudo vi /etc/selinux/config ==> setlinux =disable
#temporairement : setenforce 0
# sudo echo "selinux disable >> /etc/selinux/config ##
	nano /etc/selinux/config
	touch /.autorelabel
	read -r -p "Souhaitez-vous redemarer le service ? (O/N)" reponse
	case "$reponse" in 
	  O|o ) echo "Redemarage des services"
	        reboot;;
	  N|n ) continue;;
	esac

	echo "==============Installation Openstack================"
	yum -y update
	echo "---------------Openstack Queens ---------------"
	yum -y install centos-release-openstack-queens
	yum -y update
	echo "---------------Openstack packstack ---------------"
	yum -y install openstack-packstack
	echo "---------------Openstack all ---------------"
	packstack --allinone --os-heat-install=y
fi


