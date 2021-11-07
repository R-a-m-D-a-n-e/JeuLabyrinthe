source gener_laby.sh
source fin_partie.sh
declare -a temp


import_niveaux()
{
	if [[ -e  "partie" ]]
	then
		rm -r "partie"
	fi

	mkdir partie

	ifs=$IFS

	IFS=":"

	read -a temp <liste_laby/laby$_NIVEAU


	L=${temp[0]:0:2}
	H=${temp[0]:3:2}


	for (( i=4;i<=$H+4;i++ ))
	do
		for (( j=0;j<=(3*$L);j+=3 ))
		do
			if [[ ${temp[$i]:$j:3} != "  |" ]]
			then
				M[$(($i-4)),$(($j/3))]=-1
			else
				M[$(($i-4)),$(($j/3))]=0
			fi
		done
	done
	IFS="$ifs"

	exporter partie/laby$_NIVEAU
}

creer_sotrie()
{

	sortie_x=0
	sortie_y=0

	case $(( $RANDOM%4 )) in
		0)	sortie_x=0
			sortie_y=$(( ($RANDOM%(($L-1)/2))*2+1 ))
			;;
		1)	sortie_x=$(( $H-1 ))
			sortie_y=$(( ($RANDOM%(($L-1)/2))*2+1 ))
			;;
		2)	sortie_x=$(( ($RANDOM%(($H-1)/2))*2+1 ))
			sortie_y=0
			;;
		3)	sortie_x=$(( ($RANDOM%(($H-1)/2))*2+1 ))
			sortie_y=$(( $L-1 ))
			;;
		esac

	M[$sortie_x,$sortie_y]=0

	exporter partie/laby$_NIVEAU


}

placer_personnage()
{
	Dedale_x=$sortie_x
	Dedale_y=$sortie_y

	Minotaure_x=$(( ($RANDOM%(($H-1)/2))*2+1 ))
	Minotaure_y=$(( ($RANDOM%(($L-1)/2))*2+1 ))


	Thesee_x=$Minotaure_x
	Thesee_y=$Minotaure_y


	def_x=0
	def_y=0

	while (( $def_x < 4 || $def_y < 4 ))
	do

		def_x=$(($Thesee_x-$Minotaure_x))
		def_y=$(($Thesee_y-$Minotaure_y))

		if (( $def_x < 0 ))
		then
			def_x=$(( -1*$def_x ))
		fi


		if (( $def_y < 0 ))
		then
			def_y=$(( -1*$def_y ))
		fi

		Thesee_x=$(( ($RANDOM%(($H-1)/2))*2+1 ))
		Thesee_y=$(( ($RANDOM%(($L-1)/2))*2+1 ))
	done

	M[$Dedale_x,$Dedale_y]=1
	M[$Thesee_x,$Thesee_y]=2
	M[$Minotaure_x,$Minotaure_y]=3

	exporter partie/laby$_NIVEAU

}

creer_partie()
{
	import_niveaux

	creer_sotrie

	placer_personnage

}


test_fin_partie()
{
	fin=`awk -f test_fin_partie.awk partie/laby$_NIVEAU `

	if [[ -z $fin ]]
	then
		fin=1
	fi


}
affiche_labyrinthe()
{
	resize -s 40 150
	clear
	test_fin_partie
	while (( $fin == "1" ))
	do
		awk -f afficher_NV.awk "partie/laby$_NIVEAU" 
		test_fin_partie
		sleep 0.1
	done

}

