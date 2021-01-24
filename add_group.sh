#!/bin/bash

read -r -p "Ajouter un groupe, nom:" reponse

sudo addgroup $reponse
