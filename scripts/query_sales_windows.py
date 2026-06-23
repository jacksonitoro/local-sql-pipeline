import duckdb
from pathlib import Path

con = duckdb.connect("local.duckdb")

con.execute("""
    CREATE OR REPLACE TABLE sales AS
    SELECT * FROM read_csv_auto('data/raw/sales.csv');
""")

sql_path = Path("sql/sales_cte_windows.sql")
query = sql_path.read_text()

result = con.execute(query).fetchall()
print(result)