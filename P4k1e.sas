proc sql;
   create table paylist
       (IdNum char(4),
        Gender char(1),
        Jobcode char(3),
        Salary num,
        Birth num informat=date10.
                  format=date10.,
        Hired num informat=date7.
                  format=date7.);
insert into paylist
    values('1639','F','TA1',42260,'26JUN70'd,'28JAN91'd)
    values('1065','M','ME3',38090,'26JAN54'd,'07JAN92'd)
    values('1400','M','ME1',29769.'05NOV67'd,'16OCT90'd)
	values('1561','M',null,36514,'30NOV63'd,'07OCT87'd)
    values('1221','F','FA3',.,'22SEP63'd,'04OCT94'd);
    
title 'Paylist Table';
select * from paylist;

title 'Paylist Table by Hired Year after 1990';
select Gender, sum (Salary) as totalSalary format=dollar8.
      from paylist 
      group by Gender having year(Hired) in 
      	(select year(Hired) from paylist where year(Hired)>1990);
      
proc printto; 
run;