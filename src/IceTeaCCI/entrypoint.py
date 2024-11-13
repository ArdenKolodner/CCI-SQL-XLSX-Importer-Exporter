from .sql_to_xlsx import sql_to_xlsx
from .xlsx_to_sql import xlsx_to_sql
import sys # For accessing command line arguments directly
import argparse # Used for parsing command line arguments

def entry_icetea():
  if len(sys.argv) < 2:
    print("Usage: icetea in [args] | icetea out [args]")
    print("Or use the dataset_to_excel and excel_to_dataset commands")
    sys.exit(1)

  if sys.argv[1] == "in":
    sql_to_xlsx(sys.argv[2:])
  elif sys.argv[1] == "out":
    xlsx_to_sql(sys.argv[2:])
  else:
    print("Usage: icetea in [args] | icetea out [args]")
    print("Or use the dataset_to_excel and excel_to_dataset commands")
    sys.exit(1)

if __name__ == "__main__":
  entry_icetea()