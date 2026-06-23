import duckdb
from pathlib import Path

con = duckdb.connect("local.duckdb")

con.execute("""
    CREATE OR REPLACE TABLE customers AS
    SELECT * FROM read_csv_auto('data/raw/customers.csv');
""")

con.execute("""
    CREATE OR REPLACE TABLE sales AS
    SELECT * FROM read_csv_auto('data/raw/sales.csv');
""")

sql_path = Path("sql/sales_customers_joins.sql")
query = sql_path.read_text()

result = con.execute(query).fetchall()
print(result)