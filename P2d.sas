PROC IMPORT DATAFILE='/home/u63487999/BirthsKingCounty2001.xlsx'
	OUT=IMPORT
	DBMS=XLSX
	REPLACE;
	GETNAMES=NO;
	sheet="test2";
RUN;

PROC PRINT data = IMPORT;
RUN;