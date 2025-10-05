/* -----------------------------------------------------------
   Aesthetic Activity 1: Default Style and Grouping (Functional Aesthetic)
   ----------------------------------------------------------- */
TITLE "Default Aesthetic: Position and Color for Car Origin";

PROC SGPLOT DATA=sashelp.cars;
    /* Position/Length Aesthetic: Map mean horsepower to bar height.
    Note that the value of a variable determines its location on 
    an axis (position) or its size (length/height), 
    representing the most critical aesthetic element 
    as it directly encodes the quantitative data.*/
   
    VBAR Origin / RESPONSE=Horsepower STAT=MEAN GROUP=DriveTrain;
    

    /* Color/Grouping Aesthetic: Map 'DriveTrain' (e.g., Front, Rear) 
    to distinct colors */
    KEYLEGEND / TITLE="Drive Train";
    XAXIS LABEL="Car Origin";
    YAXIS LABEL="Mean Horsepower";
RUN;


/* -----------------------------------------------------------
   Aesthetic Activity 2: Custom Style (Design Aesthetic)
   Changing the ODS style completely changes the look, feel, and color palette.
   STYLE=Journal or Journal2 or HTMLBlue or Daisy or Analysis or HTMLBlue
   ----------------------------------------------------------- */
ODS HTML file="/home/u63487999/output.html" GPATH="/home/u63487999/" STYLE=Analysis;
ODS GRAPHICS /reset imagename='output' outputfmt=PNG HEIGHT = 2in WIDTH = 3in; 

TITLE "Journal Style Aesthetic: Cleaner, Minimalist Design";

PROC SGPLOT DATA=sashelp.cars;
    /* Retain the same data mapping, 
    but the visual execution (color, font, background) changes */
    VBAR Origin / RESPONSE=Horsepower STAT=MEAN GROUP=DriveTrain;
    KEYLEGEND / TITLE="Drive Train";
    XAXIS LABEL="Car Origin";
    YAXIS LABEL="Mean Horsepower";
RUN;

ODS HTML STYLE=Statistical; /* Reset to a standard, often more colorful, style */
ods html close;