import duckdb
from pathlib import Path

con = duckdb.connect("local.duckdb")

# Ensure raw table exists
con.execute("""
    CREATE OR REPLACE TABLE bikeshare_raw AS
    SELECT *
    FROM read_csv_auto('data/raw/bikeshare_trips.csv');
""")

# Run the cleaning SQL
sql_path = Path("sql/bikeshare_clean.sql")
query = sql_path.read_text()
con.execute(query)

# Quick check: show a few cleaned rows
rows = con.execute("SELECT * FROM bikeshare_clean LIMIT 5;").fetchall()
print(rows)

# Optional: export to processed CSV
con.execute("""
    COPY (SELECT * FROM bikeshare_clean)
    TO 'data/processed/bikeshare_clean.csv'
    (HEADER, DELIMITER ',');
""")