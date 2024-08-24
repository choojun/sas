/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;
	select Name label='State', Area format=comma10. 
    	from myLib.unitedstates;

	*select Name, Population format=comma12., Area format=comma8., 
    		Population/Area as Density format=comma10. 
      	from myLib.countries order by Density desc;
	*select Name, Population format=comma12., Area format=comma8., 
			Population/Area format=comma10. label='Density' 
		from myLib.countries order by 4 desc;
	*select Name, Continent 
		from myLib.countries order by Population;
			
	select Name, LowPoint
      	from myLib.continents order by LowPoint;
run;
quit;