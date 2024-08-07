data personalData;
   input Name weight height;
   datalines;
Ali 90 4.9
Baba 50 5.5
Chong 75 6.0
Emily 40 5.5
;

data updatedPersonalData;
    SET personalData;
    heightInInches = height * 12;
    heightInMeters = heightInInches * 0.0254;
    heightInCM = heightInMeters * 100;
    
    BMI = (weight / (heightInCM * heightInCM)) * 10000;
    BMI2 = (weight / (heightInCM ** 2)) * 10000;
run;

proc print data=updatedPersonalData;
run;