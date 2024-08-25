/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* full outer join:
	A full outer join, specified with the keywords FULL JOIN and ON, 
	selects all matching and nonmatching rows. 
	*/
	select City '#City#(WorldCityCoords)' format=$20.,
    		Capital '#Capital#(Countries)' format=$20.,
          	Population, Latitude, Longitude
    	from myLib.countries full join myLib.worldcitycoords
        on Capital = City and  Name = Country; 
      	
      	
    /* By using the COALESCE function, 
    we can overlay columns so that only the row from the table 
    that contains data is listed. 
    Recall that COALESCE takes a list of columns as its arguments 
    and returns the first nonmissing value that it encounters.
    */
    *select coalesce(Capital, City,Name)format=$20. 'City',
          	coalesce(Name, Country) format=$20. 'Country',
          	Population, Latitude, Longitude
      	from myLib.countries full join myLib.worldcitycoords
           	on Capital = City and Name = Country; 
run;
quit;