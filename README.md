# Local SQL Pipeline (DuckDB + Python)

# local-sql-pipeline
Learning data engineering basics: Git, Python, VS Code, and SQL on DuckDB with an end‑to‑end mini ETL pipeline.

This repo is a small local data engineering project to practice Python, DuckDB, and SQL.  
It loads CSV files from `data/raw` into DuckDB, runs analytical SQL (GROUP BY, ORDER BY), and prints results from Python.  
The goal is to build up to joins, CTEs, and window functions as the project grows.

## Project structure

- `data/raw/` – source CSV files
- `data/processed/` – cleaned or transformed data outputs
- `sql/` – SQL queries (e.g. `sales_aggregation.sql`)
- `scripts/` – Python scripts (e.g. `test_duckdb.py`, `query_sales.py`)
- `output/` – exported results or reports
- `docs/` – notes or architecture diagrams

## Getting started

1. Create and activate a virtual environment:
   - `python -m venv .venv`
   - `source .venv/Scripts/activate`  (Git Bash on Windows)

2. Install dependencies:
   - `pip install duckdb`

3. Run a simple test query:
   - `python scripts/test_duckdb.py`  → should print `[(1,)]`

4. Run the sales aggregation example:
   - Make sure `data/raw/sales.csv` exists
   - `python scripts/query_sales.py` → prints total amount per customer

