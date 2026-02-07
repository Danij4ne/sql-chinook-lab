# SQL-Chinook-Lab

<p align="center">
  <img 
    src="https://github.com/user-attachments/assets/f546b00d-80d1-4fcb-8be7-8b32de5b62b6"
    alt="sql-chinook-kab"
    style="max-width: 100%; height: auto;"
  />
</p>

![T-SQL](https://img.shields.io/badge/T--SQL-CC2927?style=flat&logo=microsoftsqlserver&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-3366CC?style=flat&logo=postgresql&logoColor=white)
![SQL Lab](https://img.shields.io/badge/Structured-SQL_Lab-0A66C2?style=flat)
![Daily Challenges](https://img.shields.io/badge/Practice-Daily_Challenges-F39C12?style=flat)
![Chinook DB](https://img.shields.io/badge/Database-Chinook-8E44AD?style=flat)
![Progressive Levels](https://img.shields.io/badge/Architecture-Progressive_Levels-9cf?style=flat)
![License](https://img.shields.io/badge/License-MIT-27AE60?style=flat)


## 1. Overview

A structured collection of SQL challenges and analytical mini-projects based on the Chinook sample database. The repository mirrors the same progression across **PostgreSQL** and **SQL Server**, with each challenge packaged as a small, self-contained unit.

## 2. Repository Objective

Provide a consistent, engine-specific SQL practice and reference set built on real relational data. The structure is designed to support quick execution, deterministic results, and side-by-side comparison between PostgreSQL and SQL Server approaches where syntax differs.

## 3. Requirements

- **PostgreSQL** (local install or container)
- **SQL Server** (local install, Docker, or cloud instance)
- A SQL client (one of the following):
  - psql / Azure Data Studio / DBeaver / DataGrip / SSMS

## 4. Why This Project Matters

Most SQL repositories stop at simple exercises or disconnected queries.  
This project was designed to go a step further by focusing on **reproducibility, structure, and real analytical patterns** used in production environments.

What makes this repository different:

- **Deterministic validation**  
  Every challenge includes a `result.sql` file with the expected output.

- **Engine comparison (PostgreSQL & SQL Server)**  
  The same analytical problems are implemented across two major SQL engines.

- **Progressive technical depth**  
  From basic `SELECT` statements to window functions, CTE workflows, and analytical mini-projects.

- **Real-world analytical thinking**  
  Revenue analysis, customer segmentation, leaderboards, trends, and retention-style queries.

- **Designed as a reference library**  
  Useful for learning, interview preparation, and long-term SQL pattern reference.

This project reflects a production mindset: **clear requirements, deterministic outputs, and structured analytical logic**.

## 5. Setup

### PostgreSQL

1. Create a database (example name: `chinook`).
2. Import the schema + data:
   - File: `database/postgresql/Chinook.sql`

### SQL Server

1. Create a database (example name: `Chinook`).
2. Import the schema + data:
   - File: `database/sqlserver/Chinook.sql`

## 6. How to Run a Challenge

Example (PostgreSQL):

1. Connect to the `chinook` database.
2. Open the challenge query:
   - `challenges/postgres/level_01_basics_select/challenge_001_select_customers/challenge.sql`
3. Execute the SQL in your client.
4. Compare your output with the expected result file:
   - `challenges/postgres/level_01_basics_select/challenge_001_select_customers/result.sql`

The same workflow applies to SQL Server challenges under:

- `challenges/sqlserver/...`

## 7. Validation Approach

All challenges include a **deterministic expected result** (`result.sql`) to ensure reproducibility.

**How validation works:**

1. Run `challenge.sql`.
2. Run `result.sql`.
3. Verify:
   - Same rows  
   - Same column order  
   - Same sorting  

This guarantees correctness across SQL engines.

## 8. Repository Structure

- `assets/`Diagrams and supporting visuals (e.g., schema image).
- `database/`Engine-specific Chinook import scripts.
- `challenges/`
  Challenge sets for PostgreSQL and SQL Server, organized by level and topic.

## 9. Index by Level

### PostgreSQL

| Level | Topic                  | Folder                       | Link                                                  |
| ----: | ---------------------- | ---------------------------- | ----------------------------------------------------- |
|    01 | Basics: SELECT         | level_01_basics_select       | `challenges/postgres/level_01_basics_select/`       |
|    02 | Core JOINs             | level_02_joins_core          | `challenges/postgres/level_02_joins_core/`          |
|    03 | GROUP BY + Aggregates  | level_03_group_by_aggregates | `challenges/postgres/level_03_group_by_aggregates/` |
|    04 | Subqueries             | level_04_subqueries          | `challenges/postgres/level_04_subqueries/`          |
|    05 | Window Functions       | level_05_window_functions    | `challenges/postgres/level_05_window_functions/`    |
|    06 | Advanced CTE Workflows | level_06_cte_advanced        | `challenges/postgres/level_06_cte_advanced/`        |
|    07 | Projects               | level_07_projects            | `challenges/postgres/level_07_projects/`            |

### SQL Server

| Level | Topic                  | Folder                       | Link                                                   |
| ----: | ---------------------- | ---------------------------- | ------------------------------------------------------ |
|    01 | Basics: SELECT         | level_01_basics_select       | `challenges/sqlserver/level_01_basics_select/`       |
|    02 | Core JOINs             | level_02_joins_core          | `challenges/sqlserver/level_02_joins_core/`          |
|    03 | GROUP BY + Aggregates  | level_03_group_by_aggregates | `challenges/sqlserver/level_03_group_by_aggregates/` |
|    04 | Subqueries             | level_04_subqueries          | `challenges/sqlserver/level_04_subqueries/`          |
|    05 | Window Functions       | level_05_window_functions    | `challenges/sqlserver/level_05_window_functions/`    |
|    06 | Advanced CTE Workflows | level_06_cte_advanced        | `challenges/sqlserver/level_06_cte_advanced/`        |
|    07 | Projects               | level_07_projects            | `challenges/sqlserver/level_07_projects/`            |

## 10. Concepts Addressed

- Core querying (SELECT, WHERE, ORDER BY, LIMIT/TOP)
- Relational joins across normalized tables
- Aggregations, grouping, and KPI-style metrics
- Subqueries (scalar, correlated, set-based filtering)
- Window functions (ranking, running totals, offsets, percentiles)
- CTE-based workflows (multi-step and recursive patterns)
- Multi-step analytical reporting using SQL only

## 11. Practical Use

- Analytics queries for customer, country, and sales performance
- Reporting patterns: leaderboards, trends, segmentation, and rollups
- SQL engine comparison: syntax differences and portable query design
- Reference library for common SQL patterns in real relational schemas

## Exercises

Each challenge folder contains exactly:

- `challenge.sql`
- `result.sql`

## Module / Repository Summary

A two-engine Chinook challenge library organized by technical progression, designed for repeatable execution and consistent validation using expected result files.

## 12. Dataset: Chinook

This repository uses the **Chinook sample database**, a well-known open-source relational dataset that models a digital music store.

Original Chinook database repository:
https://github.com/lerocha/chinook-database

The database schema and data are derived from that project and adapted for PostgreSQL and SQL Server execution.

All SQL challenges, solutions, structure, and analytical workflows contained here are **original work**.

## Author

**Daniel Jane Garcia**

GitHub: danij4ne
