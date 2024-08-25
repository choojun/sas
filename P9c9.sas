/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* natural join:
	A natural join automatically selects columns from each table 
	to use in determining matching rows.
	*/
	select country, barrelsperday 'Production', barrels 'Reserve'
      	from myLib.oilprod natural join myLib.oilrsrvs
      	order by barrelsperday desc;
      	
run;
quit;