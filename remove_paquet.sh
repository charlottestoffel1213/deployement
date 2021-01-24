#!/bin/bash

read -r -p "Choississez un paquet à supprimer ?" reponse


sudo apt remove $reponse
