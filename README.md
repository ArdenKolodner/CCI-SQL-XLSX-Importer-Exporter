# CCI SQL XLSX Importer/Exporter
 Converts SQL databases generated by Cumulus CI into Excel, for manual editing, and converts them back to SQL files.

# Usage
Change the INPUT_FILE variable in the Python scripts to reflect the file you wish to convert, and optionally the OUTPUT_FILE variable. Then run the script. This will be replaced by a more user-friendly method shortly.

# Important Info
## Don't Start an XLSX File from Scratch
This tool is for editing the SQL files in Excel, not a general-purpose tool for converting XLSX data to SQL scripts. If you try to run it on an arbitrary XLSX file, it will probably fail, since the proper data won't be encoded in the comments (see Comments below).

## End Detection
When converting an XLSX file back to an SQL file, 

## Comments
SQL databases contain information that doesn't have a direct analogue in Excel, like the PRIMARY KEY/NOT NULL constraints. This information needs to be kept along with each field, so this tool stores the info in comments attached to the field headers. Please don't edit or delete those comments!

If you modify a field header, make sure the comment goes with it! For example, to add a new field, insert a new column rather than manually copying the values rightwards. And to delete a field, delete the itself, rather than just deleting the values (see End Detection above).

Comments on the cells of records are not checked. You can feel free to leave comments there; the tool will ignore them.

# Dependencies
Python 3 (built-in modules sqlite3, json, os, platform, and sys), and OpenPyXL
## Installing Dependencies
You can install Python [here](https://www.python.org/downloads/), but it may be pre-installed on your machine.

You may also need to install pip. Instructions can be found [here](https://pip.pypa.io/en/stable/installation/). TL;DR: run `python -m ensurepip --upgrade` on Linux/MacOS, or `py -m ensurepip --upgrade` on Windows.

Then use pip to install OpenPyXL: `pip install openpyxl`