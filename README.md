## LabCorp
This repository has a Python scripts to process [LabCorp PDF reports](https://patient.labcorp.com/portal/dashboard):

### Scripts
- [`labcorp-parse`](labcorp-parse.md): Parses one or more reports and produces a summary in any of the following forms:
    - Tabular text
    - CSV: Comma-separated values, excellent for importing into a spreadsheet app
    - JSON: Another style of storing data, excellent for processing my scripts, apps, etc
- [`labcorp-plot`](labcorp-plot.md): Plots results in PNG images

### Requirements
- A Python 3 interpreter.  If you don't already have one, what's wrong with you?
- `labcorp-parse` requires the `pdftotext` command.  As per [these installation instructions](https://www.linuxuprising.com/2019/05/how-to-convert-pdf-to-text-on-linux-gui.html#:~:text=Convert%20PDF%20to%20text%20with%20pdftotext%20(command%20line)), I tried to install the command on Ubuntu with:
    ```
    sudo apt install poppler-utils
    ```
    I have Ubuntu 20 and apparently the package was already installed but I don't remember ever doing it.  I don't think I've ever used commands from the package before.
  
    You can read more about the package and its other commands at https://www.xpdfreader.com/about.html.
- `labcorp-plot` requires the [`mathplotlib`](https://matplotlib.org/stable/index.html) Python package