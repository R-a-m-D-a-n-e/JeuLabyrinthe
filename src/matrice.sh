#! /bin/bash

initialiser()
{
	k=0
	

	for(( i=0;i<$H;i++ ))
	do
		for(( j=0;j<$L;j++ ))
		do
			if (( $i%2!=0 && $j%2!=0 ))
			then

				M[$i,$j]=$(($k))
				((k++))
			else
				M[$i,$j]=-1
			fi
		done
	done
}

affiche_matrice()
{
	for(( i=0;i<$H;i++ ))
	do
		for(( j=0;j<$L;j++ ))
		do
			printf "%.d\t"${M[$i,$j]}
		done
		printf "\n"
	done

}

exporter()
{



	printf "$L|$H:" >$1
	printf "$Dedale_x|$Dedale_y:" >>$1
	printf "$Thesee_x|$Thesee_y:" >>$1
	printf "$Minotaure_x|$Minotaure_y:\033[30;47m" >>$1
	for(( i=0;i<$H;i++ ))
	do
		for(( j=0;j<$L;j++ ))
		do
			if (( ${M[$i,$j]}!=-1 ))
			then
				if (( ${M[$i,$j]}==1 ))
				then
					printf "\033[34m勒\033[30;47m|" >>$1
				elif (( ${M[$i,$j]}==2 ))
				then
					printf "\033[35m鸡\033[30;47m|" >>$1
				elif (( ${M[$i,$j]}==3 ))
				then
					printf "\033[31m贼\033[30;47m|" >>$1
				else
					printf "  |" >>$1
				fi
			else
				if(( $i==0 ))
				then
					if(( $j==0 ))
					then
						printf "╔═|" >>$1
					else
						if(( $j==($L-1) ))
						then
							printf "═╗|" >>$1
						else
							printf "═╦|" >>$1
						fi
					fi
				elif(( $i==($H-1) ))
				then
					if(( $j==0 ))
					then
						printf "╚═|" >>$1
					else
						if(( $j==($L-1) ))
						then
							printf "═╝|" >>$1
						else
							printf "═╩|" >>$1
						fi
					fi
				else
					if(( $j==0 ))
					then
						printf "╠═|" >>$1
					else
						if(( $j==($L-1) ))
						then
							printf "═╣|" >>$1
						else
							printf "═╬|" >>$1
						fi
					fi
				fi
			fi
		done
		printf ":" >>$1
	done
	printf "\033[0m" >>$1
}

propagation()
{
	for(( i=0;i<$H;i++ ))
	do
		for(( j=0;j<$L;j++ ))
		do
			if(( ${M[$i,$j]}==$1 ))
			then
				M[$i,$j]=$2
			fi
		done
	done

}

min()
{
	if(( $1>$2 ))
	then
		min=$2
	else
		min=$1
	fi

}

detruire_mur()
{
	min ${M[$x1,$y1]} ${M[$x2,$y2]}


	M[$x3,$y3]=$min

	if(( $min==${M[$x1,$y1]} ))
	then
		propagation ${M[$x2,$y2]} $min #transforme tout les case contenant ${M[$x2,$y2]} en $min
	else
		propagation ${M[$x1,$y1]} $min #transforme tout les case contenant ${M[$x1,$y1]} en $min
	fi

}

test_coordonnees_valid() # x y
{
	if(( $2<$L &&  $1<$H && $1>0 && $2>0 && $1%2!=0 && $2%2!=0))
	then
		return 0
	fi
	return 1
}

case_a_deteruire()
{	
	x1=1
	y1=1
	x2=1
	y2=1
	x3=0
	y3=0

	while(( ${M[$x3,$y3]}!=-1 || ${M[$x1,$y1]} == ${M[$x2,$y2]} )) #ajouter le test sur les chiffre 
	do

		x1=$((($RANDOM%(($H-1)/2))*2+1))
		y1=$((($RANDOM%(($L-1)/2))*2+1))

		x2=$x1
		y2=$y1

		case $(($RANDOM%4)) in
			0) x2=$(($x1+2));; # bas
			1) x2=$(($x1-2));; # haut
			2) y2=$(($y1+2));; # droite
			3) y2=$(($y1-2));; # gauche
		esac

		x3=$((($x1+$x2)/2))
		y3=$((($y1+$y2)/2))

		test_coordonnees_valid $x2 $y2 #pour detruire que les mur interieur. si en fait le test x3 y3 en peut detruire les mure exterieur

		if(( $?==1 ))
		then
			x2=$x1
			y2=$y1
		fi
	done

}

fin_deteruire()
{
	for(( a=0;$a<$H;a++ ))
	do
		for(( b=0;$b<$L;b++ ))
		do
			if(( $a%2!=0 && $b%2!=0 && ${M[$a,$b]}!=0 ))
			then
				return 0
			fi
		done
	done

	return 1
}

creer_labyrinthe()
{
	Dedale_x=0
	Dedale_y=0
	Thesee_x=0
	Thesee_y=0
	Minotaure_x=0
	Minotaure_y=0

	initialiser
	fin_deteruire
	while(( $?!=1 ))
	do
		case_a_deteruire
		detruire_mur
		fin_deteruire
	done

	exporter $1
}


