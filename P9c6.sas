/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* right outer join:
	A right join, specified with the keywords RIGHT JOIN and ON, 
	is the opposite of a left join: nonmatching rows 
	from the right-hand table (the second table listed in the FROM clause) 
	are included with all matching rows in the output.
	*/
	select City format=$20., Country 'Country' format=$20., 
    		Population
    	from myLib.countries right join myLib.worldcitycoords 
        	on Capital = City and Name = Country
      	order by City;
      	
run;
quit;