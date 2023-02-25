## LabCorp
This repository has a Python script to process LabCorp PDF reports, parse out the significant health metrics, and render them in convenient summaries using a style of your choosing.

### Syntax
```commandline
usage: labcorp-parse [-h] [-s {tabular,json,csv}] [-v] path [path ...]

Parse LabCorp result PDF files

positional arguments:
  path                  One or more paths to LabCorp result PDF file

options:
  -h, --help            show this help message and exit
  -s {tabular,json,csv}, --style {tabular,json,csv}
                        Print style
  -v, --verbose         Enable debugging
```

### Requirements
- A Python 3 interpreter.  If you don't already have one, what's wrong with you?
- The `pdftotext` command.  As per [these installation instructions](https://www.linuxuprising.com/2019/05/how-to-convert-pdf-to-text-on-linux-gui.html#:~:text=Convert%20PDF%20to%20text%20with%20pdftotext%20(command%20line)), I tried to install the command on Ubuntu with:
    ```
    sudo apt install poppler-utils
    ```
    I have Ubuntu 20 and apparently the package was already installed but I don't remember ever doing it.  I don't think I've ever used commands from the package before.
  
    You can read more about the package and its other commands at https://www.xpdfreader.com/about.html.

### Examples

#### Default (fixed tabular output)
This is a great choice for reading by a human.
```commandline
$ ./labcorp-parse 2019-09-25.pdf 2020-01-23.pdf 
Date        Test                   Result  Flag  Units        Reference Interval  Lab
2019-09-24  Glucose                99            mg/dL        65 - 99             01
2019-09-24  BUN                    14            mg/dL        6 - 24              01
2019-09-24  Creatinine             1.02          mg/dL        0.76 - 1.27         01
2019-09-24  eGFR If NonAfricn Am   81            mL/min/1.73  >59
2019-09-24  eGFR If Africn Am      94            mL/min/1.73  >59
2019-09-24  Sodium                 141           mmol/L       134 - 144           01
2019-09-24  Potassium              4.9           mmol/L       3.5 - 5.2           01
2019-09-24  Chloride               104           mmol/L       96 - 106            01
2019-09-24  Carbon Dioxide, Total  19      Low   mmol/L       20 - 29             01
2019-09-24  Calcium                9.6           mg/dL        8.7 - 10.2          01
2019-09-24  Protein, Total         6.9           g/dL         6.0 - 8.5           01
2019-09-24  Albumin                4.4           g/dL         3.5 - 5.5           01
2019-09-24  Globulin, Total        2.5           g/dL         1.5 - 4.5
2019-09-24  Bilirubin, Total       0.4           mg/dL        0.0 - 1.2           01
2019-09-24  Alkaline Phosphatase   63            IU/L         39 - 117            01
2019-09-24  AST (SGOT)             18            IU/L         0 - 40              01
2019-09-24  ALT (SGPT)             19            IU/L         0 - 44              01
2019-09-24  Cholesterol, Total     184           mg/dL        100 - 199           01
2019-09-24  Triglycerides          184     High  mg/dL        0 - 149             01
2019-09-24  HDL Cholesterol        32      Low   mg/dL        >39                 01
2019-09-24  VLDL Cholesterol Cal   37            mg/dL        5 - 40
2019-09-24  LDL Cholesterol Calc   115     High  mg/dL        0 - 99
2020-01-23  Glucose                96            mg/dL        65 - 99             01
2020-01-23  BUN                    10            mg/dL        6 - 24              01
2020-01-23  Creatinine             1.08          mg/dL        0.76 - 1.27         01
2020-01-23  eGFR If NonAfricn Am   76            mL/min/1.73  >59
2020-01-23  eGFR If Africn Am      88            mL/min/1.73  >59
2020-01-23  Sodium                 138           mmol/L       134 - 144           01
2020-01-23  Potassium              4.8           mmol/L       3.5 - 5.2           01
2020-01-23  Chloride               103           mmol/L       96 - 106            01
2020-01-23  Carbon Dioxide, Total  19      Low   mmol/L       20 - 29             01
2020-01-23  Calcium                9.4           mg/dL        8.7 - 10.2          01
2020-01-23  Protein, Total         6.7           g/dL         6.0 - 8.5           01
2020-01-23  Albumin                4.2           g/dL         3.8 - 4.9           01
2020-01-23  Globulin, Total        2.5           g/dL         1.5 - 4.5
2020-01-23  Bilirubin, Total       0.5           mg/dL        0.0 - 1.2           01
2020-01-23  Alkaline Phosphatase   64            IU/L         39 - 117            01
2020-01-23  AST (SGOT)             20            IU/L         0 - 40              01
2020-01-23  ALT (SGPT)             22            IU/L         0 - 44              01
2020-01-23  Cholesterol, Total     170           mg/dL        100 - 199           01
2020-01-23  Triglycerides          124           mg/dL        0 - 149             01
2020-01-23  HDL Cholesterol        35      Low   mg/dL        >39                 01
2020-01-23  VLDL Cholesterol Cal   25            mg/dL        5 - 40
2020-01-23  LDL Cholesterol Calc   110     High  mg/dL        0 - 99
$
```

#### JSON
JSON is a format style that is easily processed by computers (especially Python scripts) while still being pretty readable by humans. 
```commandline
$ ./labcorp-parse --style json 2019-09-25.pdf 2020-01-23.pdf  | headtail -40 -n
[
  {
    "date": "2019-09-24",
    "test": "Glucose",
    "result": "99",
    "flag": null,
    "units": "mg/dL",
    "reference interval": "65 - 99",
    "lab": "01"
  },
  {
    "date": "2019-09-24",
    "test": "BUN",
    "result": "14",
    "flag": null,
    "units": "mg/dL",
    "reference interval": "6 - 24",
    "lab": "01"
  },
  {
.
.
.
  },
  {
    "date": "2020-01-23",
    "test": "VLDL Cholesterol Cal",
    "result": "25",
    "flag": null,
    "units": "mg/dL",
    "reference interval": "5 - 40",
    "lab": null
  },
  {
    "date": "2020-01-23",
    "test": "LDL Cholesterol Calc",
    "result": "110",
    "flag": "High",
    "units": "mg/dL",
    "reference interval": "0 - 99",
    "lab": null
  }
]
$
```
Here's an example of a using such a file in Python:
```commandline
$ python
Python 3.11.2 (main, Feb  8 2023, 14:49:24) [GCC 9.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import json
>>> with open('labcorp.json') as stream:
...   report = json.load(stream)
... 
>>> len(report)
44
>>> report[0]
{'date': '2019-09-24', 'test': 'Glucose', 'result': '99', 'flag': None, 'units': 'mg/dL', 'reference interval': '65 - 99', 'lab': '01'}
>>> import sys
>>> json.dump(report[0], sys.stdout, indent=2)
{
  "date": "2019-09-24",
  "test": "Glucose",
  "result": "99",
  "flag": null,
  "units": "mg/dL",
  "reference interval": "65 - 99",
  "lab": "01"
}>>> 
```

#### CSV
This style of output isn't especially easily read by humans but it's well-suited for spreadsheets.
```commandline
$ ./labcorp-parse --style csv 2019-09-25.pdf 2020-01-23.pdf  | headtail -40 -n
Date,Test,Result,Flag,Units,Reference Interval,Lab
2019-09-24,Glucose,99,,mg/dL,65 - 99,01
2019-09-24,BUN,14,,mg/dL,6 - 24,01
2019-09-24,Creatinine,1.02,,mg/dL,0.76 - 1.27,01
2019-09-24,eGFR If NonAfricn Am,81,,mL/min/1.73,>59,
2019-09-24,eGFR If Africn Am,94,,mL/min/1.73,>59,
2019-09-24,Sodium,141,,mmol/L,134 - 144,01
2019-09-24,Potassium,4.9,,mmol/L,3.5 - 5.2,01
2019-09-24,Chloride,104,,mmol/L,96 - 106,01
2019-09-24,"Carbon Dioxide, Total",19,Low,mmol/L,20 - 29,01
2019-09-24,Calcium,9.6,,mg/dL,8.7 - 10.2,01
2019-09-24,"Protein, Total",6.9,,g/dL,6.0 - 8.5,01
2019-09-24,Albumin,4.4,,g/dL,3.5 - 5.5,01
2019-09-24,"Globulin, Total",2.5,,g/dL,1.5 - 4.5,
2019-09-24,"Bilirubin, Total",0.4,,mg/dL,0.0 - 1.2,01
2019-09-24,Alkaline Phosphatase,63,,IU/L,39 - 117,01
2019-09-24,AST (SGOT),18,,IU/L,0 - 40,01
2019-09-24,ALT (SGPT),19,,IU/L,0 - 44,01
2019-09-24,"Cholesterol, Total",184,,mg/dL,100 - 199,01
2019-09-24,Triglycerides,184,High,mg/dL,0 - 149,01
.
.
.
2020-01-23,Creatinine,1.08,,mg/dL,0.76 - 1.27,01
2020-01-23,eGFR If NonAfricn Am,76,,mL/min/1.73,>59,
2020-01-23,eGFR If Africn Am,88,,mL/min/1.73,>59,
2020-01-23,Sodium,138,,mmol/L,134 - 144,01
2020-01-23,Potassium,4.8,,mmol/L,3.5 - 5.2,01
2020-01-23,Chloride,103,,mmol/L,96 - 106,01
2020-01-23,"Carbon Dioxide, Total",19,Low,mmol/L,20 - 29,01
2020-01-23,Calcium,9.4,,mg/dL,8.7 - 10.2,01
2020-01-23,"Protein, Total",6.7,,g/dL,6.0 - 8.5,01
2020-01-23,Albumin,4.2,,g/dL,3.8 - 4.9,01
2020-01-23,"Globulin, Total",2.5,,g/dL,1.5 - 4.5,
2020-01-23,"Bilirubin, Total",0.5,,mg/dL,0.0 - 1.2,01
2020-01-23,Alkaline Phosphatase,64,,IU/L,39 - 117,01
2020-01-23,AST (SGOT),20,,IU/L,0 - 40,01
2020-01-23,ALT (SGPT),22,,IU/L,0 - 44,01
2020-01-23,"Cholesterol, Total",170,,mg/dL,100 - 199,01
2020-01-23,Triglycerides,124,,mg/dL,0 - 149,01
2020-01-23,HDL Cholesterol,35,Low,mg/dL,>39,01
2020-01-23,VLDL Cholesterol Cal,25,,mg/dL,5 - 40,
2020-01-23,LDL Cholesterol Calc,110,High,mg/dL,0 - 99,
$
```
_Excel_ or _LibreOffice Calc_ can easily open this style of output.

##### LibreOffice Calc example
1. When you first try to open the file, LibreOffice Calc displays a _Text Import_ window asking you how you want it to process the input file.  Make sure you turn on the _Comma_ checkbox under _Separator Options_:

    <img src="images/libreoffice calc open prompt.png" width="350" height="400">

    At the bottom of the window, you can see that LibreOffice Calc is showing a preview of what the columns will look like if it opened the file as specified.

    I didn't even realize you could have multiple separators and I didn't notice that _Other_ was still being used too.  They are checkboxes, after all - not radio buttons!  I probably would have turned off _Other_ if I had noticed but it makes no difference because there are none of those characters in the input file.
2. After you select the separator, press the _Ok_ button and let the spreadsheet do its magic!

    <img src="images/libreoffice calc open.png" width="450" height="400">

##### Excel
I don't have an example of opening a CSV file in Excel but I expect it's similar and you can probably Google for an example online. 