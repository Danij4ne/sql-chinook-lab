
/*
PROJECT 092 - CUSTOMER RETENTION ANALYSIS
Difficulty: PROJECT
Database: Chinook

DESCRIPTION:
Analyze customer retention using invoice activity over time.

REQUIREMENTS:
  1) Create a table of customer purchase frequency:
       - Total number of invoices per customer
       - First purchase date per customer
       - Most recent purchase date per customer
     Output columns must be:
       customer_id, first_name, last_name, invoice_count, first_invoice_date, last_invoice_date

  2) Define "returning customer" as:
       - invoice_count >= 2
     Create a table that lists only returning customers.
     Output columns must be:
       customer_id, first_name, last_name, invoice_count

  3) Create retention summary KPIs (1 row):
       - total_customers
       - returning_customers
       - returning_rate_pct (returning_customers / total_customers * 100)
     Output columns must be:
       total_customers, returning_customers, returning_rate_pct

  4) Create a monthly retention trend:
       - For each month (based on invoice_date), count how many customers made their FIRST purchase in that month
       - Count how many of those customers made at least one MORE purchase after that month
     Output columns must be:
       cohort_month, new_customers, retained_customers, retention_rate_pct

NOTES:
- Use Postgres syntax:
    - DATE_TRUNC('month', invoice_date)::date for cohort_month
    - Use COUNT(DISTINCT ...) when needed
- Each section must be clearly labeled with SQL comments.
*/
