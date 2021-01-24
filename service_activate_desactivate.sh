#!/bin/bash

read -r -p "
==> Quel service souhaitez-vous modifier ? (Pour acceder à la liste des services tapez 1) " service

if [ "$service" != "1" ]; then
	
	etat=`systemctl is-enabled $service`
		

	if [ $etat == "disabled" ]; then

		read -p "
Service '$service' desactivé. Souhaitez vous activer ce service ? (O/N) " activer
		
		case "$activer" in 
	  	  O|o ) systemctl enable $service;;
		  N|n ) exit;;
		esac

	elif [ $etat == "enabled" ]; then
		read -r -p "
Service $service actif. Souhaitez vous desactiver ce service ? (O/N) " desactiver
		case "$desactiver" in 
	  	  O|o ) systemctl disable $service;;
		  N|n ) exit;;
		esac
	fi

elif [[ "$service" -eq 1 ]]; then
	systemctl list-unit-files --type=service
fi
