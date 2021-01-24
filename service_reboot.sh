#!/bin/bash

read -r -p "
====> Quel service souhaitez-vous redémarer ? (Pour acceder à la liste des services tapez liste) " service

if [[ "$service" != "liste" ]]; then
	echo "=====Reboot un service======"
	sudo systemctl restart $service

elif [[ "$service" == "liste" ]]; then
	systemctl list-unit-files --type=service
fi
