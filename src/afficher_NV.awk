#! /bin/awk -f

BEGIN {
	RS=":";
	FS="|";
}

{
	if( NR==1)
	{
		_Y=(150/2)-$1;
		_X=(41-$2)/2;
	}
	if( NR>4)
	{
		j=1
		for(i=0;i<=150-(2*_Y);i=i+2)
		{
			print "\033["NR+_X";"i+_Y"H"$j;
			j++
		}
	}

}
