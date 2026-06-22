import duckdb
from pathlib import Path

con = duckdb.connect("local.duckdb")

# Load the CSV into a table
con.execute("""
    CREATE OR REPLACE TABLE sales AS
    SELECT * FROM read_csv_auto('data/raw/sales.csv');
""")

# Read SQL from file
sql_path = Path("sql/sales_aggregation.sql")
query = sql_path.read_text()

result = con.execute(query).fetchall()
print(result)