/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* left outer join:
	A left outer join lists matching rows and rows from 
	the left-hand table (the first table listed in the FROM clause) 
	that do not match any row in the right-hand table. 
	A left join is specified with the keywords LEFT JOIN and ON.
	*/
	select Capital format=$20., Name 'Country' format=$20., 
    		Latitude, Longitude
    	from myLib.countries a left join myLib.worldcitycoords b
           	on a.Capital = b.City and a.Name = b.Country
      	order by Capital;
      	
run;
quit;