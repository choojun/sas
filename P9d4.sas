/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	select * from myLib.oilrsrvs o
    	where exists 
        	(select Continent from myLib.countries c
            	where o.Country = c.Name and Continent = 'Africa');
            	
run;
quit;