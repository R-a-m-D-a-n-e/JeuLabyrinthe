menu()
{
printf "\033[31m╔═══════════════════════════════════════════════════════════════════════════════════════════════════════╗\033[0m\n"
printf "\033[31m║\033[34m\t     _              ____         _          _                _       _   _          \t\t\033[31m║\033[0m\n"
printf "\033[31m║\033[34m\t    | | ___ _   _  |  _ \\  ___  | |    __ _| |__  _   _ _ __(_)_ __ | |_| |__   ___ \t\t\033[31m║\033[0m\n"
printf "\033[31m║\033[32m\t _  | |/ _ \\ | | | | | | |/ _ \\ | |   / _\' | \'_ \\| | | | \'__| | \'_ \\| __| \'_ \\ / _ \\ \t\t\033[31m║\033[0m\n"
printf "\033[31m║\033[32m\t| |_| |  __/ |_| | | |_| |  __/ | |__| (_| | |_) | |_| | |  | | | | | |_| | | |  __/ \t\t\033[31m║\033[0m\n"
printf "\033[31m║\033[33m\t \\___/ \\___|\\__,_| |____/ \\___| |_____\\__,_|_.__/ \\__, |_|  |_|_| |_|\\__|_| |_|\\___|\t\t\033[31m║\033[0m\n"
printf "\033[31m║\033[33m\t                                                  |___/                             \t\t\033[31m║\033[0m\n"
printf "\033[31m╠╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦═════════════════════════════════════════╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╦╣\033[0m\n"
printf "\033[31m╠═╬══╬═╬═╬═╬═╬═╬═╬═╬═╬═╬═╬═╬═╬═╣					 ╠═╬══╬═╬═╬═╬═╬═╬═╬═╬═╬═╬═╬═╬═╬═╣\033[0m\n"
printf "\033[31m╠          ═╬      ═╬      ═╬  ╣\033[$1m                 Jouez                   \033[0m\033[31m╠                  ═╬      ═╬  ╣\033[0m\n"
printf "\033[31m╠  ═╬═╬═╬  ═╬  ═╬  ═╬  ═╬═╬═╬  ╣					 ╠  ═╬  ═╬  ═╬  ═╬═╬═╬  ═╬  ═╬  ╣\033[0m\n"
printf "\033[31m╠  ═╬          ═╬          ═╬  ╣					 ╠  ═╬  ═╬  ═╬          ═╬      ╣\033[0m\n"
printf "\033[31m╠═╬═╬  ═╬═╬═╬  ═╬  ═╬═╬═╬═╬═╬  ╣\033[$2m                Quitter                  \033[0m\033[31m╠═╬═╬  ═╬═╬═╬═╬═╬  ═╬═╬═╬  ═╬═╬╣\033[0m\n"
printf "\033[31m╠          ═╬  ═╬              ╣					 ╠              ═╬      ═╬      ╣\033[0m\n"
printf "\033[31m╚═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩╩═════════════════════════════════════════╩═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩═╩╝\033[0m\n"

}

afficher_menu()
{
	_choix="a"
	_select=1

	resize -s 18 105
	clear
	menu 47 0

	while [[ $_choix != "" ]]
	do

		read -s -n 1 _choix
	
		case $_choix in
			"z") ((_select--))
				if(( $_select<=0 ))
				then
					_select=2
				fi
			;;
			"s") ((_select++))
				if(( $_select>2 ))
				then
					_select=1
				fi
			;;
		esac

		case $_select in
			1) clear;menu 47 0 ;;
			2) clear;menu 0 47 ;;
		esac

	done
	
	if (( $_select==2 ))
	then
		exit
	fi
}

kill_()
{
	kill1=`ps -u | grep -n "bash affiche_labyrinthe" | awk '{ printf $2 }'`
	kill2=`ps -u | grep -n "bash move_thesee_minotaure" | awk '{ printf $2 }'`
	kill3=`ps -u | grep -n "bash jouer" | awk '{ printf $2 }'`
	kill4=`ps -u | grep -n "bash rejouer" | awk '{ printf $2 }'`
	kill5=`ps -u | grep -n "bash please_wait" | awk '{ printf $2 }'`
	kill6=`ps -u | grep -n "bash creer_niveaux" | awk '{ printf $2 }'`
	
	kill -9 $kill1 $kill2 $kill3 $kill4 $kill5 2>partie/fin
}

Quitter()
{
	kill_

	if [[ -e "partie" ]]
	then
		rm -r "partie"
	fi

	if [[ -e "liste_laby" ]]
	then
		rm -r "liste_laby"
	fi

	afficher_menu

}
please_wait()
{
	resize -s 18 105

	clear

	_cmp=`ls liste_laby/ | wc -w`

	q=0
	_C=40

	printf "\033[8;44H\033[32mPlease Wait\033[m\n"

	while (( $_cmp < 9 ))
	do
		if (( $_cmp != $q ))
		then
			for (( ;q<$_cmp;q++ ))
			do
				printf "\033[9;"$_C"H\033[42m \033[0m "
				_C=$(( $_C+2 ))
			done

			q=$_cmp
		fi
		
		_cmp=`ls liste_laby/ | wc -w`
	done

}


