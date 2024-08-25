/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* union join:
	A union join combines two tables without attempting to match rows. 
	All columns and rows from both tables are included. 
	Combining tables with a union join is similar to combining them with 
	the OUTER UNION set operator.
	*/
	select City '#City#(WorldCityCoords)' format=$20.,
    		Capital '#Capital#(Countries)' format=$20.,
          	Population, Latitude, Longitude
    	from myLib.countries union join myLib.worldcitycoords; 
      	
run;
quit;