import duckdb

con = duckdb.connect("local.duckdb")
result = con.execute("SELECT 1 AS x").fetchall()
print(result)