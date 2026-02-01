
/*
PROJECT 094 - COUNTRY REVENUE COMPARISON
Difficulty: PROJECT
Database: Chinook

DESCRIPTION:
Analyze and compare revenue performance across countries using invoice data.

REQUIREMENTS:
  1) Calculate country-level KPIs:
       - Total revenue
       - Total number of invoices
       - Average invoice value
     Output columns must be:
       country, total_revenue, invoice_count, avg_invoice_value

  2) Rank countries by total revenue.
     Add a window function column:
       - revenue_rank (highest revenue = 1)
     Output columns must be:
       revenue_rank, country, total_revenue

  3) Identify countries performing above the global average revenue per country.
     Output columns must be:
       country, total_revenue

  4) Create a year-over-year revenue comparison by country:
       - year
       - country
       - yearly_revenue
     Output columns must be:
       year, country, yearly_revenue
     Sorting:
       country ASC, year ASC

NOTES:
- Use Postgres syntax:
    - EXTRACT(YEAR FROM invoice_date) for year
- Each section must be clearly labeled with SQL comments.
*/
