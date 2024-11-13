# What is IceTea?
Tired of fiddling with obscure, confusing SQL files? Take a break. Have some IceTea.
IceTea is a tool that converts SQL databases generated by Cumulus CI into Excel, for manual editing, and converts them back to SQL files for CCI to use.

# Installation
First make sure you have Python 3 and pip. You can install Python [here](https://www.python.org/downloads/), but it may be pre-installed on your machine. You may also need to install pip. Instructions can be found [here](https://pip.pypa.io/en/stable/installation/). TL;DR: run `python -m ensurepip --upgrade` on Linux/MacOS, or `py -m ensurepip --upgrade` on Windows. (If you get an error that the `python` or `pip` commands aren't found, try running `python3` or `pip3` instead.)

Then run `pip install cci_sql_xlsx_converter` to install the tool. All done!

# Usage
To import into Excel, run `icetea in`. To export back to SQL, run `icetea out`.

Legacy commands: You can also use `dataset_to_excel` or `ds2xl` to import, and `excel_to_dataset` or `xl2ds` to export.

## Arguments
### Common
`-i, --input`: path to input file. By default, this is `./datasets/sample.sql` or `./generated.xlsx` for the SQL-to-XLSX or XLSX-to-SQL scripts respectively. (The assumption is that the script is run from the project folder.)
`-o, --output`: path to save the generated file as. The default values are the same as `-i` but swapped: `./generated.xlsx` and `./datasets/sample.sql` respectively.

Open output file:
`-of, --open-file`: Open the generated file once it's complete.
`-nof, --no-open-file`: Do not open the file.
Default behavior is to open the generated XLSX file, but not to open the generated SQL/YML files.

Logging arguments (all default to off):
`-ltn, --log-table-names`: Display a log message for each table that is loaded/detected.
`-lr, --log-records`: Display a log message for each record.
`-lf, --log-fields`: Display a log message for each field in a table.
`-sw, --suppress-warnings`: Prevent warning messages from appearing.

### XLSX-to-SQL Specific
Delete input file:
`-d, --delete-xlsx`: Delete the XLSX file after the new SQL file is generated.
`-p, --preserve-xlsx`: Do not delete the file.
Default behavior is to DELETE the XLSX file! This is done so that there aren't 2 competing versions of the data floating around.

# Important Info/Warnings
## Don't Rename Sheets or Fields
The names of the worksheets in the Excel spreadsheet are linked to the names of the tables, and the headers of each column are linked to the field names. If you want to change the name of a table or field, do it in SalesForce, not Excel. However, you can safely re-order columns or sheets.

## Don't Start an XLSX File from Scratch
This tool is for editing the SQL files in Excel, not a general-purpose tool for converting XLSX data to SQL scripts. If you try to run it on an arbitrary XLSX file, it will probably fail, since the proper data won't be encoded in the comments (see Comments below).

## End Detection
Do not leave any blank columns in the XLSX file, except at the rightward edge. The tool will stop looking for fields once it sees a blank column, and any further data will be ignored. Blank rows are allowed, though discouraged.

## Comments
SQL databases contain information that doesn't have a direct analogue in Excel, like the PRIMARY KEY/NOT NULL constraints. This information needs to be kept along with each field, so this tool stores the info in comments attached to the field headers. Please don't edit or delete those comments!

If you modify a field header, make sure the comment goes with it! For example, to add a new field, insert a new column rather than manually copying the values rightwards. And to delete a field, delete the itself, rather than just deleting the values (see End Detection above).

Comments on the cells of records are not checked. You can feel free to leave comments there; the tool will ignore them.