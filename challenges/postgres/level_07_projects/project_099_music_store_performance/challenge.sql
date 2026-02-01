
/*
PROJECT 099 - MUSIC STORE PERFORMANCE REPORT
Difficulty: PROJECT
Database: Chinook

DESCRIPTION:
Build a full performance report for the music store, combining sales, customers, and product metrics.

REQUIREMENTS:
  1) Global store KPIs (1 row):
       - Total revenue
       - Total invoices
       - Total customers
       - Average invoice value
     Output columns must be:
       total_revenue, total_invoices, total_customers, avg_invoice_value

  2) Top 10 customers by total spending.
     Output columns must be:
       customer_id, first_name, last_name, total_spent
     Sorting:
       total_spent DESC

  3) Top 10 artists by total revenue.
     Output columns must be:
       artist_id, artist_name, total_revenue
     Sorting:
       total_revenue DESC

  4) Sales distribution by country:
       - country
       - total_revenue
       - revenue_share_pct
     Sorting:
       revenue_share_pct DESC

  5) Monthly revenue trend:
       - year
       - month
       - monthly_revenue
     Sorting:
       year ASC, month ASC

NOTES:
- Revenue is:
    invoice.total
- Artist revenue must be calculated using invoice_line.
- Each section must be clearly labeled with SQL comments.
*/
