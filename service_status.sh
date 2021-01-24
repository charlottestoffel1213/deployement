#!/bin/bash

read -r -p "
====> Quel service souhaitez-vous consulter ? (Pour acceder à la liste des services tapez liste) " service


if [[ "$service" != "liste" ]]; then
	echo "
>>>>>>>>>>>>>  Status de $service  <<<<<<<<<<<<<<"
	etat=`systemctl is-enabled $service`

	if [ $etat == "disabled" ]; then
		echo "disable"
	elif [ $etat == "enable" ]; then
		echo "enable"
	fi

elif [[ "$service" == "liste" ]]; then
	systemctl list-unit-files --type=service
fi

