/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* with multicolumn joins */
	select Capital format=$12., Name format=$12.,
          	City format=$12., Country format=$12., 
          	Latitude, Longitude
		from myLib.countries, myLib.worldcitycoords
      	where Capital like 'L%' and Capital = City;
	select Capital format=$12., Name format=$12.,
          	City format=$12., Country format=$12., 
          	latitude, longitude
      	from myLib.countries, myLib.worldcitycoords
      	where Capital like 'L%' and Capital = City
      	and Name = Country;
      	
run;
quit;