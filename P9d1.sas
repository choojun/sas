/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* Observe the same output */
	select Name 'State' , population format=comma10. 
      	from myLib.unitedstates 
      	where population gt
        	(select population from myLib.countries 
        	where name = "Belgium");
    select Name 'State', population format=comma10. 
      	from myLib.unitedstates 
      	where population gt 10162614;
	
run;
quit;