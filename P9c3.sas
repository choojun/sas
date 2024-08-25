/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* with data from multiple tables */
	select us.Capital format=$15., us.Name 'State' format=$15., 
    		pc.Code, c.Latitude, c.Longitude
    	from myLib.unitedstates us, myLib.postalcodes pc, 
           	myLib.uscitycoords c
      	where us.Capital = c.City and
            us.Name = pc.Name and
            pc.Code = c.State;
      	
run;
quit;