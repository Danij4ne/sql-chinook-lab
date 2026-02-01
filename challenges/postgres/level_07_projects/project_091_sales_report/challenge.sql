
/*
PROJECT 091 - GLOBAL SALES SUMMARY REPORT
Difficulty: PROJECT
Database: Chinook

DESCRIPTION:
Create a detailed sales report analyzing invoice data across all countries and customers.

REQUIREMENTS:
  1) Calculate KPIs (1 row):
       - Total global sales
       - Total number of invoices
       - Average invoice value
       - Highest and lowest invoice totals

  2) Identify the top 10 highest-spending customers (by total invoice amount).

  3) Aggregate sales by:
       - Country
       - Year
       - Month
     Output columns must be:
       country, year, month, sales

  4) Create a table of countries ranked by total sales.
     Output columns must be:
       country_rank, country, total_sales

  5) Create a table of customers ranked by total spending.
     Output columns must be:
       customer_rank, customer_id, first_name, last_name, total_spent

  6) Create a monthly revenue trend (year-month).
     Output columns must be:
       year, month, monthly_sales

NOTES:
- Use Postgres syntax:
    - LIMIT instead of TOP
    - EXTRACT(YEAR FROM ...) / EXTRACT(MONTH FROM ...) for year/month
- Each section must be clearly labeled with SQL comments.
*/
