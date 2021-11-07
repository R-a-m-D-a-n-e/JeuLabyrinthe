#! /bin/awk -f

BEGIN{
	RS=":";
	FS="|";
	Minotaure_x=substr(ARGV[1],3,2)+5;
	Minotaure_y=substr(ARGV[2],3,2)+1;

}
{

	if( NR==1)
	{
		_Y=$1;
		_X=$2;
	}

	if( NR==4)
	{
		Minotaure_init_x=$1+5;
		Minotaure_init_y=$2+1;
		printf Minotaure_x-5"|"Minotaure_y-1":"
	}
	else
	{
		for(i=1;i<=_Y;i++)
		{
			if( i==Minotaure_y && NR==Minotaure_x )
			{
				printf "\033[31m贼\033[30;47m|"
			}
			else
			{
				if( 	i==Minotaure_init_y && NR==Minotaure_init_x)
				{
					printf "  |"
				}
				else
				{
					printf $i"|"
				}
			}
		}
		printf ":"
	}

}

