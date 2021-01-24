#!/bin/bash

read -r -p "Consulter les groupes d'un utilisateur, nom user:" user

grep $user /etc/passwd | cut -f4 -d:


