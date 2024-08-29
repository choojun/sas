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
    
    
    *insert into myCountries
   		select * from myLib.countries where population ge 130000000;
	*select * from myCountries;
	*insert into myCountries
      	set name='Bangladesh', capital='Dhaka', population=126391060
      	set name='Japan', capital='Tokyo', population=126352003;
	*select name format=$20., capital format=$15., population format=comma15.0
      	from myCountries;
    *insert into myCountries
      	values ('Pakistan', 'Islamabad', 123060000, ., ' ', .)
      	values ('Nigeria', 'Lagos', 99062000, ., ' ', .); 
    *select name format=$20., capital format=$15., population format=comma15.0
      	from myCountries;
    
    
    *insert into myCountries (Name, Population)
   		select Name,Population from myLib.countries
      		where population ge 130000000;
    *select * from myCountries;
run;
quit;