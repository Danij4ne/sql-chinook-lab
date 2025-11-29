# SQL-Chinook-Lab

The SQL-Chinook-Lab is a structured collection of daily SQL challenges and analytical mini-projects based on the open-source Chinook database.
The repository is organized into progressive modules covering essential and advanced SQL topics, ranging from basic queries to multi-step analytical workflows.

---

## 1. Purpose

This repository consolidates a complete sequence of SQL practice exercises designed around real relational data.
Each module isolates a specific technical domain such as filtering, joins, aggregation, subqueries, window functions, or CTE-based workflows.
The structure provides a unified workspace for querying, analysis, and SQL problem-solving.

---

## 2. Concepts Addressed

The project covers a wide set of SQL capabilities:

- Basic selection, filtering, ordering, and pattern matching
- Relational joins across multiple linked tables
- Aggregations, grouping logic, and metric computation
- Subqueries, scalar queries, correlated queries, and set-based filters
- Window functions for ranking, partitioning, offsets, and cumulative metrics
- Common Table Expressions, including chained CTEs and recursive workflows
- Multi-step analytical problem-solving using SQL alone
- End-to-end datasets analysis using the Chinook relational schema

---

## 3. Practical Use

The repository enables structured SQL practice on a realistic schema, supporting:

- Progressive query construction from basic to advanced
- Exploration of multi-table relational structures through joins
- Scenario-based analysis using aggregations and window functions
- Analytical report creation using CTEs and multi-layer workflows
- Development of reusable SQL patterns for data analysis and reporting
- Execution and validation of SQL statements directly on the Chinook database

---

## 4. Exercises

The following tree provides an overview of all challenge and project files included in the repository.

```
daily_challenges/
├── level_01_basics_select/
│   ├── challenge_001_select_customers.sql
│   ├── challenge_002_filter_customers_by_country.sql
│   ├── challenge_003_order_customers.sql
│   ├── challenge_004_select_invoices_top.sql
│   ├── challenge_005_distinct_countries.sql
│   ├── challenge_006_find_expensive_tracks.sql
│   ├── challenge_007_basic_where_conditions.sql
│   ├── challenge_008_limit_tracks_results.sql
│   ├── challenge_009_sort_tracks_by_name.sql
│   ├── challenge_010_filter_invoices_by_date.sql
│   ├── challenge_011_select_playlist_names.sql
│   ├── challenge_012_filter_tracks_by_bytes.sql
│   ├── challenge_013_find_tracks_by_name_pattern.sql
│   ├── challenge_014_find_customers_by_email.sql
│   └── challenge_015_select_tracks_price_range.sql
│
├── level_02_joins_core/
│   ├── challenge_016_joins.sql
│   ├── challenge_017_joins.sql
│   ├── challenge_018_joins.sql
│   ├── challenge_019_joins.sql
│   ├── challenge_020_joins.sql
│   ├── challenge_021_joins.sql
│   ├── challenge_022_joins.sql
│   ├── challenge_023_joins.sql
│   ├── challenge_024_joins.sql
│   ├── challenge_025_joins.sql
│   ├── challenge_026_joins.sql
│   ├── challenge_027_joins.sql
│   ├── challenge_028_joins.sql
│   ├── challenge_029_joins.sql
│   ├── challenge_030_joins.sql
│   ├── challenge_031_joins.sql
│   ├── challenge_032_joins.sql
│   ├── challenge_033_joins.sql
│   ├── challenge_034_joins.sql
│   └── challenge_035_joins.sql
│
├── level_03_group_by_aggregates/
│   ├── challenge_036_groupby.sql
│   ├── challenge_037_groupby.sql
│   ├── challenge_038_groupby.sql
│   ├── challenge_039_groupby.sql
│   ├── challenge_040_groupby.sql
│   ├── challenge_041_groupby.sql
│   ├── challenge_042_groupby.sql
│   ├── challenge_043_groupby.sql
│   ├── challenge_044_groupby.sql
│   ├── challenge_045_groupby.sql
│   ├── challenge_046_groupby.sql
│   ├── challenge_047_groupby.sql
│   ├── challenge_048_groupby.sql
│   ├── challenge_049_groupby.sql
│   ├── challenge_050_groupby.sql
│   ├── challenge_051_groupby.sql
│   ├── challenge_052_groupby.sql
│   ├── challenge_053_groupby.sql
│   ├── challenge_054_groupby.sql
│   └── challenge_055_groupby.sql
│
├── level_04_subqueries/
│   ├── challenge_056_subquery.sql
│   ├── challenge_057_subquery.sql
│   ├── challenge_058_subquery.sql
│   ├── challenge_059_subquery.sql
│   ├── challenge_060_subquery.sql
│   ├── challenge_061_subquery.sql
│   ├── challenge_062_subquery.sql
│   ├── challenge_063_subquery.sql
│   ├── challenge_064_subquery.sql
│   ├── challenge_065_subquery.sql
│   ├── challenge_066_subquery.sql
│   ├── challenge_067_subquery.sql
│   ├── challenge_068_subquery.sql
│   ├── challenge_069_subquery.sql
│   └── challenge_070_subquery.sql
│
├── level_05_window_functions/
│   ├── challenge_071_window.sql
│   ├── challenge_072_window.sql
│   ├── challenge_073_window.sql
│   ├── challenge_074_window.sql
│   ├── challenge_075_window.sql
│   ├── challenge_076_window.sql
│   ├── challenge_077_window.sql
│   ├── challenge_078_window.sql
│   ├── challenge_079_window.sql
│   └── challenge_080_window.sql
│
├── level_06_cte_advanced/
│   ├── challenge_081_cte.sql
│   ├── challenge_082_cte.sql
│   ├── challenge_083_cte.sql
│   ├── challenge_084_cte.sql
│   ├── challenge_085_cte.sql
│   ├── challenge_086_cte.sql
│   ├── challenge_087_cte.sql
│   ├── challenge_088_cte.sql
│   ├── challenge_089_cte.sql
│   └── challenge_090_cte.sql
│
└── level_07_projects/
    ├── project_091_sales_report.sql
    ├── project_092_customer_retention_analysis.sql
    ├── project_093_artist_performance_dashboard.sql
    ├── project_094_country_revenue_comparison.sql
    ├── project_095_genre_popularity_deep_dive.sql
    ├── project_096_album_profitability_study.sql
    ├── project_097_tracks_popularity_analysis.sql
    ├── project_098_repeat_customers.sql
    ├── project_099_music_store_performance.sql
    └── project_100_advanced_analytics_challenge.sql
```

---

## 5. Module Summary

SQL-Chinook-Lab provides a complete and organized environment for querying the Chinook database across all major SQL domains.
The repository consolidates atomic challenges and full analytical projects, enabling systematic exploration of relational structures, aggregations, subqueries, window logic, and multi-step analysis techniques.
Each module stands as an independent block dedicated to a distinct SQL capability, producing a comprehensive reference framework for practical SQL development.

---

Author: Daniel Jane Garcia (danij4ne)
