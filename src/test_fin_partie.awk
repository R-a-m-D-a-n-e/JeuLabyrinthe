#! /bin/awk -f
	
BEGIN{
	RS=":";
	FS="|";

}
{
	if(NR==2)
	{
		Dedale_x=$1
		Dedale_y=$2
	}

	if(NR==3)
	{
		Thesee_x=$1
		Thesee_y=$2
	}

	if(NR==4)
	{
		Minotaure_x=$1
		Minotaure_y=$2
	}

	if(NR>4)
	{
		test_fin_x=Dedale_x- Minotaure_x
		test_fin_y=Dedale_y- Minotaure_y

		if ( test_fin_x < 0 )
		{
			test_fin_x=-1* test_fin_x
		}

		if ((  test_fin_y < 0 ))
		{
			test_fin_y=-1* test_fin_y
		}



		if ( (  test_fin_x==0 &&  test_fin_y==1 ) || (  test_fin_x==1 &&  test_fin_y==0 ) )
		{
			printf 0
			exit 0
		}




		test_fin_x=Thesee_x- Minotaure_x
		test_fin_y=Thesee_y- Minotaure_y

		if ( test_fin_x < 0 )
		{
			test_fin_x= -1*test_fin_x 
		}

		if ( test_fin_y < 0 )
		{
			test_fin_y=  -1* test_fin_y 
		}

		if ( (  test_fin_x==0 &&  test_fin_y==1 ) || (  test_fin_x==1 &&  test_fin_y==0 ) )
		{
			printf 0
			exit 0
		}




		test_fin_x= (  Thesee_x- Dedale_x )
		test_fin_y= (  Thesee_y- Dedale_y )

		if (  test_fin_x < 0 )
		{
			test_fin_x= ( -1* test_fin_x )
		}

		if ( test_fin_y < 0 )
		{
			test_fin_y= -1* test_fin_y
		}


		if ( (  test_fin_x==0 &&  test_fin_y==1 ) || (  test_fin_x==1 &&  test_fin_y==0 ) )
		{
			printf 2
			exit 0
		}


		printf 1
		exit 0
	}
}
