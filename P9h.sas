/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; 

	create table myCountries
      		like myLib.countries;
        *describe table myCountries;
        insert into myCountries
   		select * from myLib.countries where population ge 130000000;
	select * from myCountries;
	
	
	delete from myCountries
		where name like 'R%';
	select * from myCountries;
      
run;

quit;
