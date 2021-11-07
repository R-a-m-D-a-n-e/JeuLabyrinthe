#! /bin/bash

source gener_laby.sh
source menu.sh
source partie.sh
source deplacement.sh
declare -A M




jouer()
{

	choisir_niveaux

	creer_partie

	test_fin_partie

	affiche_labyrinthe &

	move_thesee_minotaure &


	while [[ $fin = "1" ]]
	do
		dep_dedale
		test_fin_partie

		if [[ $fin = "0" ]]
		then
			kill_
			game_over
		fi

		if [[ $fin = "2" ]]
		then
			kill_
			week_end
		fi


	done
}

rejouer()
{
	afficher_menu
	jouer
}

play()
{
	afficher_menu
	creer_niveaux &
	please_wait

	while(( 1 == 1 ))
	do
		jouer
		rejouer
	done

}




