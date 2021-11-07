#! /bin/awk -f

BEGIN{
	RS=":";
	FS="|";
	Dedale_x=substr(ARGV[1],3,2)+5;
	Dedale_y=substr(ARGV[2],3,2)+1;

}
{

	if( NR==1)
	{
		_Y=$1;
		_X=$2;
	}

	if( NR==2)
	{
		Dedale_init_x=$1+5;
		Dedale_init_y=$2+1;
		printf Dedale_x-5"|"Dedale_y-1":"
	}
	else
	{
		for(i=1;i<=_Y;i++)
		{
			if( i==Dedale_y && NR==Dedale_x )
			{
				printf "\033[34m勒\033[30;47m|"
			}
			else
			{
				if( 	i==Dedale_init_y && NR==Dedale_init_x)
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

