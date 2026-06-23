import duckdb
from pathlib import Path

con = duckdb.connect("local.duckdb")

# Reload the sales table from CSV each time
con.execute("""
    CREATE OR REPLACE TABLE sales AS
    SELECT * FROM read_csv_auto('data/raw/sales.csv');
""")

sql_path = Path("sql/sales_select_filters.sql")
query = sql_path.read_text()

result = con.execute(query).fetchall()
print(result)