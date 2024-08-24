/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;
	title 'My Table';
	
	select Name, Continent, Population from myLib.countries
		where Population gt 5000000;
	*select Name, Continent, Population from myLib.countries
		where Population between 2000000 and 5000000;


   	/* Observe the sequence of constructing SELECT statement:
   		SELECT, FROM, WHERE */
run;
quit;