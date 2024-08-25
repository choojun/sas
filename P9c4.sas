/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* with a single table self-joins */
	select High.City format $12., High.Country format $12., 
           High.AvgHigh, ' | ',
           Low.City format $12., Low.Country format $12., 
           Low.AvgLow
    	from myLib.worldtemps High, myLib.worldtemps Low
       	where High.AvgHigh = Low.AvgLow and
           High.city ne Low.city and
           High.country ne Low.country;
      	
run;
quit;