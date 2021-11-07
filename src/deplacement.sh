dep_dedale()
{
	dep_d=a


	while [[ $dep_d != [zZqQsSdD] ]]
	do
		read -s -n 1 dep_d
	done

	case $dep_d in
		"z" | "Z")
				if (( ${M[$(( $Dedale_x-1 )),$Dedale_y]} == 0 ))
				then
					M[$(( $Dedale_x-1 )),$Dedale_y]=1
					M[$Dedale_x,$Dedale_y]=0
					(( Dedale_x-- ))
				fi
			;;
		"s" | "S")
				if (( ${M[$(( $Dedale_x+1 )),$Dedale_y]} == 0 ))
				then
					M[$(( $Dedale_x+1 )),$Dedale_y]=1
					M[$Dedale_x,$Dedale_y]=0
					(( Dedale_x++ ))
				fi
			;;
		"q" | "Q")
				if (( ${M[$Dedale_x,$(( $Dedale_y-1 ))]} == 0 ))
				then
					M[$Dedale_x,$(( $Dedale_y-1 ))]=1
					M[$Dedale_x,$Dedale_y]=0
					(( Dedale_y-- ))
				fi
			;;
		"d" | "D")
				if (( ${M[$Dedale_x,$(( $Dedale_y+1 ))]} == 0 ))
				then
					M[$Dedale_x,$(( $Dedale_y+1 ))]=1
					M[$Dedale_x,$Dedale_y]=0
					(( Dedale_y++ ))
				fi
			;;
	esac

	awk -f dep_dedale.awk x="$Dedale_x" y="$Dedale_y" partie/laby$_NIVEAU >partie/laby2$_NIVEAU
	cat partie/laby2$_NIVEAU >partie/laby$_NIVEAU
}


dep_minotaure()
{


	av=0

	if (( ${M[$(( $Minotaure_x-1 )),$Minotaure_y]} == 0  && $av != 1 ))
	then
		if [[ $dirc = "W" ]]
		then
			M[$(( $Minotaure_x-1 )),$Minotaure_y]=3
			M[$Minotaure_x,$Minotaure_y]=0
			(( Minotaure_x-- ))
			dirc="N"
			av=1
		fi
	fi

	if (( ${M[$(( $Minotaure_x+1 )),$Minotaure_y]} == 0 && $av != 1 ))
	then
		if [[ $dirc = "E" ]]
		then
			M[$(( $Minotaure_x+1 )),$Minotaure_y]=3
			M[$Minotaure_x,$Minotaure_y]=0
			(( Minotaure_x++ ))
			dirc="S"
			av=1
		fi
	fi


	if (( ${M[$Minotaure_x,$(( $Minotaure_y+1 ))]} == 0 && $av != 1 ))
	then
		if [[ $dirc = "N" ]]
		then
			M[$Minotaure_x,$(( $Minotaure_y+1 ))]=3
			M[$Minotaure_x,$Minotaure_y]=0
			(( Minotaure_y++ ))
			dirc="E"
			av=1
		fi
	fi

	if (( ${M[$Minotaure_x,$(( $Minotaure_y-1 ))]} == 0 && $dirc == "S" && $av != 1 ))
	then
		if [[ $dirc = "S" ]]
		then
			M[$Minotaure_x,$(( $Minotaure_y-1 ))]=3
			M[$Minotaure_x,$Minotaure_y]=0
			(( Minotaure_y-- ))
			dirc="W"
			av=1
		fi
	fi








	if [[ $dirc = "N" && $av -ne 1 ]]
	then
		if((  ${M[$(( $Minotaure_x-1 )),$Minotaure_y]} == 0 ))
		then
			M[$(( $Minotaure_x-1 )),$Minotaure_y]=3
			M[$Minotaure_x,$Minotaure_y]=0
			(( Minotaure_x-- ))
			av=1
		else
			dirc="W"
		fi
	fi

	if [[ $dirc = "W" && $av -ne 1 ]]
	then
		if(( ${M[$Minotaure_x,$(( $Minotaure_y-1 ))]} == 0 ))
		then
			M[$Minotaure_x,$(( $Minotaure_y-1 ))]=3
			M[$Minotaure_x,$Minotaure_y]=0
			(( Minotaure_y-- ))
			av=1
		else
			dirc="S"
		fi
	fi

	if [[ $dirc = "S" && $av -ne 1 ]]
	then
		if((  ${M[$(( $Minotaure_x+1 )),$Minotaure_y]} == 0 ))
		then
			M[$(( $Minotaure_x+1 )),$Minotaure_y]=3
			M[$Minotaure_x,$Minotaure_y]=0
			(( Minotaure_x++ ))
			av=1
		else
			dirc="E"
		fi
	fi


	if [[ $dirc = "E" && $av -ne 1 ]]
	then
		if(( ${M[$Minotaure_x,$(( $Minotaure_y+1 ))]} == 0 ))
		then
			M[$Minotaure_x,$(( $Minotaure_y+1 ))]=3
			M[$Minotaure_x,$Minotaure_y]=0
			(( Minotaure_y++ ))
			av=1
		else
			dirc="N"
		fi
	fi




	awk -f dep_mino.awk x="$Minotaure_x" y="$Minotaure_y" partie/laby$_NIVEAU >partie/laby1$_NIVEAU
	cat partie/laby1$_NIVEAU >partie/laby$_NIVEAU

}


dep_thesee()
{

	avt=0

	if (( ${M[$(( $Thesee_x-1 )),$Thesee_y]} == 0  && $avt != 1 ))
	then
		if [[ $dirct = "W" ]]
		then
			M[$(( $Thesee_x-1 )),$Thesee_y]=3
			M[$Thesee_x,$Thesee_y]=0
			(( Thesee_x-- ))
			dirct="N"
			avt=1
		fi
	fi

	if (( ${M[$(( $Thesee_x+1 )),$Thesee_y]} == 0 && $avt != 1 ))
	then
		if [[ $dirct = "E" ]]
		then
			M[$(( $Thesee_x+1 )),$Thesee_y]=3
			M[$Thesee_x,$Thesee_y]=0
			(( Thesee_x++ ))
			dirct="S"
			avt=1
		fi
	fi


	if (( ${M[$Thesee_x,$(( $Thesee_y+1 ))]} == 0 && $avt != 1 ))
	then
		if [[ $dirct = "N" ]]
		then
			M[$Thesee_x,$(( $Thesee_y+1 ))]=3
			M[$Thesee_x,$Thesee_y]=0
			(( Thesee_y++ ))
			dirct="E"
			avt=1
		fi
	fi

	if (( ${M[$Thesee_x,$(( $Thesee_y-1 ))]} == 0 && $dirct == "S" && $avt != 1 ))
	then
		if [[ $dirct = "S" ]]
		then
			M[$Thesee_x,$(( $Thesee_y-1 ))]=3
			M[$Thesee_x,$Thesee_y]=0
			(( Thesee_y-- ))
			dirct="W"
			avt=1
		fi
	fi








	if [[ $dirct = "N" && $avt -ne 1 ]]
	then
		if((  ${M[$(( $Thesee_x-1 )),$Thesee_y]} == 0 ))
		then
			M[$(( $Thesee_x-1 )),$Thesee_y]=3
			M[$Thesee_x,$Thesee_y]=0
			(( Thesee_x-- ))
			avt=1
		else
			dirct="W"
		fi
	fi

	if [[ $dirct = "W" && $avt -ne 1 ]]
	then
		if(( ${M[$Thesee_x,$(( $Thesee_y-1 ))]} == 0 ))
		then
			M[$Thesee_x,$(( $Thesee_y-1 ))]=3
			M[$Thesee_x,$Thesee_y]=0
			(( Thesee_y-- ))
			avt=1
		else
			dirct="S"
		fi
	fi

	if [[ $dirct = "S" && $avt -ne 1 ]]
	then
		if((  ${M[$(( $Thesee_x+1 )),$Thesee_y]} == 0 ))
		then
			M[$(( $Thesee_x+1 )),$Thesee_y]=3
			M[$Thesee_x,$Thesee_y]=0
			(( Thesee_x++ ))
			avt=1
		else
			dirct="E"
		fi
	fi


	if [[ $dirct = "E" && $avt -ne 1 ]]
	then
		if(( ${M[$Thesee_x,$(( $Thesee_y+1 ))]} == 0 ))
		then
			M[$Thesee_x,$(( $Thesee_y+1 ))]=3
			M[$Thesee_x,$Thesee_y]=0
			(( Thesee_y++ ))
			avt=1
		else
			dirct="N"
		fi
	fi




	awk -f dep_thes.awk x="$Thesee_x" y="$Thesee_y" partie/laby$_NIVEAU >partie/laby1$_NIVEAU
	cat partie/laby1$_NIVEAU >partie/laby$_NIVEAU

}

move_thesee_minotaure()
{
	dirc="S"
	dirct="S"
	test_fin_partie
	while (( $fin == "1" ))
	do
		dep_minotaure
		dep_thesee
		test_fin_partie
		sleep 0.2
	done

}

