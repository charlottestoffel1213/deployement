#!/bin/bash

OS=`sed -n 3p /etc/os-release | cut -d= -f2`

if [[ "$OS" -eq ubuntu ]]; then
	echo ">>>>>>>>>>LISTE paquets sur UBUNTU<<<<<<<<<<<<<"
	dpkg --list
	
elif [[ "$OS" -eq centos ]]; then
	echo ">>>>>>>>>>LISTE paquets sur CENTOS<<<<<<<<<<<<<"
	yum list installed

fi
	


