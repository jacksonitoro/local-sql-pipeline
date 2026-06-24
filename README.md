# Local SQL Pipeline (DuckDB + Python)

# local-sql-pipeline
Learning data engineering basics: Git, Python, VS Code, and SQL on DuckDB with an end‑to‑end mini ETL pipeline.


## Overview

This project shows how to load, clean, and analyze data from multiple tables using Python, DuckDB, and SQL, turning raw CSVs into reusable, queryable datasets.

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

## Features

- Local DuckDB database for fast analytical SQL
- Sales mini-pipeline (sales + customers) with joins, aggregations, and window functions
- Bikeshare mini-pipeline using real trip data (raw CSV → cleaned table/CSV → station and time-of-day analysis)

## How to run: Sales mini-pipeline

1. Ensure the raw files exist:
   - `data/raw/sales.csv`
   - `data/raw/customers.csv`

2. Run the basic tests:
   - `python scripts/test_duckdb.py`  → checks DuckDB connection
   - `python scripts/query_sales.py`  → prints total amount per customer

3. Run join and aggregation examples:
   - `python scripts/query_joins.py`  → shows orders per customer using INNER/LEFT JOIN, COUNT, SUM, AVG

4. Run CTE and window examples:
   - `python scripts/query_sales_windows.py` → shows ROW_NUMBER, RANK, LAG, and running totals on sales data.

## Bikeshare pipeline

1. Place a bikeshare CSV in `data/raw/` as `bikeshare_trips.csv`.
2. Load the raw data into DuckDB:
   - `python scripts/load_bikeshare.py`
3. Create the cleaned table and export it:
   - `python scripts/clean_bikeshare.py` → creates `bikeshare_clean` table and `data/processed/bikeshare_clean.csv`
4. Run analysis queries to generate outputs in `output/`.

## How to run: Bikeshare mini-pipeline

1. Download a bikeshare trips CSV and save as:
   - `data/raw/bikeshare_trips.csv`

2. Load raw data:
   - `python scripts/load_bikeshare.py` → creates `bikeshare_raw` table

3. Clean and export:
   - `python scripts/clean_bikeshare.py` → creates `bikeshare_clean` table and `data/processed/bikeshare_clean.csv`

4. Run analyses:
   - `python scripts/analyze_bikeshare_top_stations.py` → writes `output/bikeshare_top_start_stations.csv`
   - `python scripts/analyze_bikeshare_trips_by_hour.py` → writes `output/bikeshare_trips_by_hour.csv`


## Architecture (high-level)

Sales pipeline:

    data/raw/sales.csv
           +
           data/raw/customers.csv
           |
           v
    Python scripts (query_sales.py, query_joins.py, query_sales_windows.py)
           |
           v
    DuckDB tables (sales, customers)
           |
           v
    SQL queries (aggregations, joins, window functions)
           |
           v
    Console output / future reports

Bikeshare pipeline:

    data/raw/bikeshare_trips.csv
           |
           v
    Python scripts (load_bikeshare.py, clean_bikeshare.py)
           |
           v
    DuckDB tables (bikeshare_raw, bikeshare_clean)
           |
           v
    Python + SQL analysis scripts
           |
           v
    CSV outputs in output/ (top stations, trips by hour)   