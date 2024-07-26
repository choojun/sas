proc sql;
   create table itemData
       (product_id char(4),
        quantitySold num,
        price num format=dollar8.);
insert into itemData
    values('1639',42260,3.50)
    values('1065',38090,13.55)
    values('1400',29769,12.05)
	values('1561',36514,7.55)
    values('1221',.,2.50);
    
title 'Item Listing Table';
select * from itemData;
    
proc sql;
    create table sales as
    select
        product_id,
        price,
        quantitySold * price as salesAmount format=dollar8.
    from
        itemData
    ;
    
title 'Sales Table';
select * from sales;

proc printto; 
run;