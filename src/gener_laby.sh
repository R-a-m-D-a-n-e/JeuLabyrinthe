#! /bin/bash

source matrice.sh


creer_niveaux()
{
	w=0

	if [[ -e  "liste_laby" ]]
	then
		rm -r "liste_laby"
	fi

	mkdir "liste_laby"

	for(( v=1;v<21;v=$v+2 )) 
	do
		L=$((20+$v))
		H=$((10+$v))

		creer_labyrinthe "./liste_laby/laby$w"
	
		((w++))
	done

}

afficher_liste_niveaux()
{
	resize -s 40 150

	clear


	printf "\033[20;5H\033[36m  __ \n\033[m"
	printf "\033[21;5H\033[36m / / \n\033[m"
	printf "\033[22;5H\033[36m/ /  \n\033[m"
	printf "\033[23;5H\033[36m\ \  \n\033[m"
	printf "\033[24;5H\033[36m \_\ \n\033[m"

	printf "\033[20;140H\033[36m __ \n\033[m" 
	printf "\033[21;140H\033[36m \ \\ \n\033[m"
	printf "\033[22;140H\033[36m  \ \\ \n\033[m"
	printf "\033[23;140H\033[36m  / /\n\033[m"
	printf "\033[24;140H\033[36m /_/ \n\033[m"
	
	

	awk -f afficher_NV.awk "liste_laby/laby$1"

}

choisir_niveaux()
{
	_NIVEAU=0
	_KEY=a
	
	while [[ $_KEY != "" ]]
	do
		afficher_liste_niveaux $_NIVEAU

		read -s -n 1 _KEY

		case $_KEY in
			"D" | "d") (( _NIVEAU++ ))
					if (( $_NIVEAU==10 ))
					then
						_NIVEAU=0
					fi ;;
			"Q" | "q") (( _NIVEAU-- ))
					if (( $_NIVEAU==-1 ))
					then
						_NIVEAU=9
					fi ;;
		esac
		

	done


}



