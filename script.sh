#!/bin/bash

#Partie 1 script :

while [[ $reponse != "q" ]]; do

	read -r -p "
------------------------  MENU  -----------------------------

----------- 1 ) Installation d'Openstack --------------------
----------- 2 ) Installation de Git -------------------------
----------- 3 ) Installation de Jenkins ---------------------
----------- 4 ) Installation d'un paquet --------------------
----------- 5 ) Mises à jour du système ---------------------
----------- 6 ) Afficher les paquets installés --------------
----------- 7 ) Supprimer un paquet -------------------------
----------- 8 ) Ajouter un utilisateur ----------------------
----------- 9 ) Ajouter un groupe ---------------------------
----------- 10 ) Afficher le groupe d'un utilisateur --------
----------- 11 ) Consulter le status d'un service -----------
----------- 12 ) Reboot un service --------------------------
----------- 13 ) Activer/Desactiver un service --------------
----------- 14 ) HELP : Que fait ce script ? ----------------

----------- q ) Quitter -------------------------------------

Quelle opération executer ? (entrez une numéro) : " reponse

	case "$reponse" in 
	  1 ) ./openstack.sh ;;
	  2 ) ./git.sh ;;
	  3 ) ./jenkins.sh ;;
	  4 ) ./install_paquet.sh;;
	  5 ) echo "Mettre à jour le Système"
	      sudo apt update && sudo apt upgrade;;
	  6 ) ./display_paquet.sh;;
	  7 ) ./remove_paquet.sh;;
	  8 ) ./add_user.sh;;
	  9 ) ./add_group.sh;;
	  10 ) ./display_gp_user.sh;;
	  11 ) ./service_status.sh;;
	  12 ) ./service_reboot.sh;;
	  13 ) ./service_activate_desactivate.sh;;
	  14 ) cat help.txt;;
	  q ) echo "Quitter";;
	  * ) echo "invalid";;
	esac
done
