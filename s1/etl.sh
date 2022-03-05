awk -F, '
BEGIN { 
    print "above_100,first_name,last_name,price"  
} 
{
    if ( FNR>1 && $1!="") # ignore first line of each file and lines with no name
    {
        # remove prepended zeros to the price field
        sub(/0*/,"",$2);
        price=$2 

        # split the name field into first_name and last_name
        n=split($1,a," "); 
        last_name=a[n];
        first_name=substr($1,1,length($1)-length(last_name)-1);
          
        if( int($2)>100 ) # set above_100 to ture when price is greater than 100
        {
            above_100="true"
        }
        else
        {
            above_100=""
        }
        printf "%s,%s,%s,%s\n",above_100,first_name,last_name,price
    }
}
' ../dataset1.csv ../dataset2.csv