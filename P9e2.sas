/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; 

	create table densities as
      	select Name 'Country' format $15.,
        	Population format=comma10.0,
            Area as SquareMiles,
            Population/Area format=6.2 as Density
        from myLib.countries;
	select * from densities;
	
	
	*describe table myLib.countries;
	*create table myCountries
      	like myLib.countries;
    *describe table myCountries;
    
    
    *describe table myLib.countries;
	*create table myCountries
      	like myLib.countries (drop=UNDate Continent);
    *describe table myCountries;
run;
quit;