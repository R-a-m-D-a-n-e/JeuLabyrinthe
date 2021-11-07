#! /bin/awk -f

BEGIN{
	RS=":";
	FS="|";
	Thesee_x=substr(ARGV[1],3,2)+5;
	Thesee_y=substr(ARGV[2],3,2)+1;

}
{

	if( NR==1)
	{
		_Y=$1;
		_X=$2;
	}

	if( NR==3)
	{
		Thesee_init_x=$1+5;
		Thesee_init_y=$2+1;
		printf Thesee_x-5"|"Thesee_y-1":"
	}
	else
	{
		for(i=1;i<=_Y;i++)
		{
			if( i==Thesee_y && NR==Thesee_x )
			{
				printf "\033[35m鸡\033[30;47m|"
			}
			else
			{
				if( 	i==Thesee_init_y && NR==Thesee_init_x)
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

