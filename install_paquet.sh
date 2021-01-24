#!/bin/bash

read -r -p "
====> Choississez un paquet à installer ? " reponse

sudo apt-cache search $reponse
echo "
====> Voici la liste des paquets correspondants à votre recherche. "

read -r -p "
Tapez le nom exact du paquet a installer : " paquet

sudo apt install $paquet

