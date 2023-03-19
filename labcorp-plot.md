## `labcorp-plot`
`labcorp-plot` plots results in PNG images.

### Syntax
```commandline
usage: labcorp-plot [-h] [-v] path [path ...]

Plot LabCorp results

positional arguments:
  path           Paths to one or more JSON files produced by labcorp-parse

options:
  -h, --help     show this help message and exit
  -v, --verbose  Enable debugging
```

### Example

#### Execution
```commandline
$ ./labcorp-plot *.json
Glucose.png
BUN.png
Creatinine.png
eGFR.png
Sodium.png
Potassium.png
Chloride.png
Carbon_Dioxide,_Total.png
Calcium.png
Protein,_Total.png
Albumin.png
Globulin,_Total.png
Bilirubin,_Total.png
Alkaline_Phosphatase.png
AST_(SGOT).png
ALT_(SGPT).png
Cholesterol,_Total.png
Triglycerides.png
HDL_Cholesterol.png
VLDL_Cholesterol_Cal.png
LDL_Cholesterol_Calc.png
$
```

#### Sample plot file
![Cholesterol,_Total.png](images%2FCholesterol%2C_Total.png)

The horizontal dotted lines represent the minimum and maximum healthy values for each test. Occasionally, I've noticed changes in this range over results so you might see the line change over time.