import duckdb

con = duckdb.connect("local.duckdb")

con.execute("""
    CREATE OR REPLACE TABLE bikeshare_raw AS
    SELECT *
    FROM read_csv_auto('data/raw/bikeshare_trips.csv');
""")

# Look at the first 5 rows
result = con.execute("SELECT * FROM bikeshare_raw LIMIT 5;").fetchall()
print(result)

# Optional: print column names
cols = con.execute("PRAGMA table_info('bikeshare_raw');").fetchall()
print(cols)