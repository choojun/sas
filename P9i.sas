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
	
	
	*alter table myCountries
		add density num label='Population Density' format=6.2;
	*describe table myCountries;
	*select * from myCountries;
    
    
    	*update myCountries
    		set density = population/area;
    	*select * from myCountries;


	*alter table myCountries
      		modify population format=comma15.;
	*select * from myCountries;
	
	
	*alter table myCountries
      		modify name char(60) format=$60.;
   	*update myCountries
      		set name='The WTO and the IMF has plenty members of country '||name;
	*select * from myCountries;
	
	
	*alter table myCountries
      		drop undate;
    	*select * from myCountries;
run;
quit;
