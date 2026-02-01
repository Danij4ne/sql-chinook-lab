
/*
PROJECT 100 - ADVANCED ANALYTICS CHALLENGE
Difficulty: PROJECT
Database: Chinook

DESCRIPTION:
Create an advanced analytics report combining customer value, purchase behavior, and product performance.

REQUIREMENTS:
  1) Customer Lifetime Value (CLV) table:
       - Total revenue per customer (SUM(invoice.total))
       - Total invoices per customer
       - First invoice date
       - Last invoice date
     Output columns must be:
       customer_id, first_name, last_name, country, total_spent, invoice_count, first_invoice_date, last_invoice_date

  2) Customer segmentation:
       - Define customer_tier based on total_spent:
           * 'gold'   total_spent >= 40.00
           * 'silver' total_spent >= 20.00 AND total_spent < 40.00
           * 'bronze' total_spent < 20.00
     Output columns must be:
       customer_id, total_spent, customer_tier

  3) Segment KPIs (one row per customer_tier):
       - customer_tier
       - customer_count
       - total_revenue
       - avg_revenue_per_customer
     Output columns must be:
       customer_tier, customer_count, total_revenue, avg_revenue_per_customer
     Sorting:
       total_revenue DESC

  4) Top 10 customers overall:
       - Rank customers by total_spent (highest = 1)
     Output columns must be:
       customer_rank, customer_id, first_name, last_name, total_spent
     Sorting:
       customer_rank ASC
     Limit:
       10 rows

  5) Top 5 genres by revenue per customer_tier:
       - Revenue must be computed from invoice_line (unit_price * quantity)
       - Rank genres inside each tier by total_revenue (highest = 1)
     Output columns must be:
       customer_tier, genre_name, total_revenue, genre_rank
     Sorting:
       customer_tier ASC, genre_rank ASC, genre_name ASC
     Keep only:
       genre_rank <= 5

  6) Monthly revenue trend by customer_tier:
       - month_start as DATE_TRUNC('month', invoice_date)::date
       - monthly_revenue as SUM(invoice.total)
     Output columns must be:
       customer_tier, month_start, monthly_revenue
     Sorting:
       customer_tier ASC, month_start ASC

NOTES:
- Use Postgres syntax (LIMIT, DATE_TRUNC, window functions).
- Each section must be clearly labeled with SQL comments.
*/
