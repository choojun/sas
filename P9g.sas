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
	
	
	*update myCountries
      	set population=population*1.05;
   	*select name format=$20., capital format=$15., population format=comma15.0
      from myCountries;
      
      
	*update myCountries
      	set population=population*1.05
         	where name like 'B%';
   	*update myCountries
      	set population=population*1.07
         	where name in ('China', 'Russia');
    *select name format=$20., capital format=$15., population format=comma15.0
      	from myCountries;
      	
      	
	*update myCountries
   		set population=population*
      	case when name like 'B%' then 1.05
        	 when name in ('China', 'Russia') then 1.07
           	/* else 1 */
      	end;
	*select name format=$20., capital format=$15., population format=comma15.0
      	from myCountries;
run;
quit;