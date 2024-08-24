/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;
	title 'Climate of World Cities';
   	select City, Country, Latitude,
    	case
            when Latitude gt 67 then 'North Frigid'
            when 67 ge Latitude ge 23 then 'North Temperate'
            when 23 gt Latitude gt -23 then 'Torrid'
            when -23 ge Latitude ge -67 then 'South Temperate'
        	else 'South Frigid'
        end as ClimateZone
	from myLib.worldcitycoords order by City;
      	
   *title 'Assigning Regions to Continents';
   *select Name, Continent,
        case Continent
             when 'North America' then 'Continental U.S.'
             when 'Oceania' then 'Pacific Islands' 
             else 'None'
        end as Region
    from myLib.unitedstates;
run;
quit;