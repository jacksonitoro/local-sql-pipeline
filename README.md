# Local SQL Pipeline (DuckDB + Python)

## Overview

This project shows how to load, clean, and analyze data from multiple tables using Python, DuckDB, and SQL, turning raw CSVs into reusable, queryable datasets. It serves as a completed foundation project for Day 1–10 of my data engineering learning journey.

## Project status

This project is complete and serves as my Day 1–10 foundation project for local SQL, Python, DuckDB, and data workflow practice.

## Project structure

- `data/raw/` – source CSV files (e.g. `sales.csv`, `customers.csv`, `bikeshare_trips.csv`)
- `data/processed/` – cleaned or transformed data outputs (e.g. `bikeshare_clean.csv`)
- `sql/` – SQL queries and transformation logic (e.g. `sales_aggregation.sql`, `sales_cte_windows.sql`)
- `scripts/` – Python scripts that run DuckDB queries and workflows (e.g. `test_duckdb.py`, `query_sales.py`)
- `output/` – exported analysis results and reports (e.g. top stations, trips by hour)
- `docs/` – notes or future architecture diagrams

## Getting started

1. Create and activate a virtual environment:

   - `python -m venv .venv`
   - `source .venv/Scripts/activate`  (Git Bash on Windows)

2. Install dependencies:

   - `pip install duckdb`

3. Run a simple test query:

   - `python scripts/test_duckdb.py`  → should print `[(1,)]`

## Features

- Local DuckDB database for fast analytical SQL.
- **Sales mini-pipeline**:
  - Sales + customers tables.
  - Joins, aggregations, and window functions (ROW_NUMBER, RANK, LAG, running totals).
- **Bikeshare mini-pipeline**:
  - Real trip data in CSV format.
  - Raw trips → cleaned table/CSV → station-level and time-of-day analysis.

## How to run

### Sales mini-pipeline

1. Ensure the raw files exist in `data/raw/`:
   - `sales.csv`
   - `customers.csv`

2. Run basic tests:
   - `python scripts/test_duckdb.py`  → checks DuckDB connection.
   - `python scripts/query_sales.py`  → prints total amount per customer.

3. Run join and aggregation examples:
   - `python scripts/query_joins.py`  → shows orders per customer using INNER/LEFT JOIN, COUNT, SUM, AVG.

4. Run CTE and window function examples:
   - `python scripts/query_sales_windows.py` → shows ROW_NUMBER, RANK, LAG, and running totals on sales data.

### Bikeshare mini-pipeline

1. Download a bikeshare trips CSV and save it as:

   - `data/raw/bikeshare_trips.csv`

2. Load raw data into DuckDB:

   - `python scripts/load_bikeshare.py`  → creates `bikeshare_raw` table.

3. Clean and export:

   - `python scripts/clean_bikeshare.py`  → creates `bikeshare_clean` table and `data/processed/bikeshare_clean.csv`.

4. Run analyses:

   - `python scripts/analyze_bikeshare_top_stations.py`  → writes `output/bikeshare_top_start_stations.csv` (top 5 start stations by trip count).
   - `python scripts/analyze_bikeshare_trips_by_hour.py`  → writes `output/bikeshare_trips_by_hour.csv` (trip counts by hour of day).

## Architecture (high-level)

**Sales pipeline:**

```text
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
```

**Bikeshare pipeline:**

```text
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
```

## What I learned

- Setting up a local data project with Git, Python, VS Code, and DuckDB.
- Loading, cleaning, and analyzing CSV data using Python + SQL.
- Writing SQL for filters, joins, aggregations, CTEs, and window functions.
- Designing simple, reproducible pipelines and documenting them clearly in a README and architecture overview.