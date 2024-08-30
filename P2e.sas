data myPhones;
	length Brand $20 Model $20 RAM_GB $20 Chipset $20 Price $20;
	infile cards dsd dlm='|';
	input Brand $ Model $ RAM_GB $ Chipset $ Price $;
	datalines;
		Samsung|Galaxy    A52s|8|Snapdragon 778|$      449.00
		Xiaomi|11T   PRO|8|Snandragon 888|$   759.00
		Samsung|Galaxy    A52s|8|Snapdragon 778|$   449.00
		Xiaomi|11T   PRO|8|Snandragon 888|$   759.00
	;

PROC PRINT data = myPhones label;
	var Brand / style={textalign=center};
	var Model / style={textalign=center font_weight=bold};
	var RAM_GB / style={textalign=center};
	var Chipset / style={textalign=center color=blue};
	var Price / style={textalign=right backgroundcolor=red};
	label Brand='Phone Brand' Model='Model' RAM_GB = 'RAM (GB)' Chipset='Chipset' Price='Price';
RUN;