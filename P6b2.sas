data myData;  
input @1 admissionDate date9. @11 graduationDate date9.;
format admissionDate date9.  graduationDate date9.;
datalines;  
26NOV2023 18DEC2025  
11MAR2023 18DEC2026  
;  

data myData2;
set myData;

/* INTCK is used to count the total number of years or months between dates */
Years = INTCK('YEAR', admissionDate, graduationDate);  
months = INTCK('MONTH', admissionDate, graduationDate);
  
admission_weekday = WEEKDAY(admissionDate);  
admission_month = MONTH(admissionDate);  
admission_year = YEAR(admissionDate);  
admission_quarter = QTR(admissionDate);
study_yr1 = YRDIF(admissionDate, graduationDate, 'Actual');
study_yr2 = YRDIF(admissionDate, graduationDate, '30/360');
study_yr3 = YRDIF(admissionDate, graduationDate, 'ACT/360');
study_yr4 = YRDIF(admissionDate, graduationDate, 'ACT/365');
study_yr5 = YRDIF(admissionDate, graduationDate, 'Age');

study_day1 = DATDIF(admissionDate, graduationDate, 'Actual');
study_day2 = DATDIF(admissionDate, graduationDate, '30/360');
study_day3 = DATDIF(admissionDate, graduationDate, 'ACT/360');
study_day4 = DATDIF(admissionDate, graduationDate, 'ACT/365');

today = TODAY();  
time = time(); 
sas_date = date();
sas_datetime = datetime();

run;

proc print data=myData2;
run;