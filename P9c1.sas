/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* with inner join, keyword and ORDER BY */
	select * from myLib.oilprod as p, myLib.oilrsrvs as r
    		where p.country = r.country;
	select p.country, barrelsperday 'Production', barrels 'Reserves'
      		from myLib.oilprod p, myLib.oilrsrvs r
      		where p.country = r.country order by barrelsperday desc;
      	
    	/* with comparison operator */
    	select us.City, us.State, us.Latitude, world.city, world.latitude
      		from myLib.worldcitycoords world, myLib.uscitycoords us
      		where world.city = 'Cairo' and us.latitude lt world.latitude;
      	
run;
quit;
