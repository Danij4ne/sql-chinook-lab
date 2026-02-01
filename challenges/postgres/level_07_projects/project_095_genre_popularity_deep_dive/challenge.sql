
/*
PROJECT 095 - GENRE POPULARITY DEEP DIVE
Difficulty: PROJECT
Database: Chinook

DESCRIPTION:
Build a deep-dive analysis of genre popularity using sales (invoice_line) data.

REQUIREMENTS:
  1) Genre-level sales KPIs:
       - Total revenue per genre
       - Total quantity sold per genre
       - Total number of distinct invoices per genre
       - Total number of distinct customers per genre
     Output columns must be:
       genre_id, genre_name, total_revenue, total_quantity_sold, invoice_count, customer_count

  2) Rank genres by total revenue.
     Add a window function column:
       - revenue_rank (highest revenue = 1)
     Output columns must be:
       revenue_rank, genre_id, genre_name, total_revenue

  3) Top 10 genres by total revenue.
     Output columns must be:
       revenue_rank, genre_id, genre_name, total_revenue

  4) Revenue share by genre (percentage of total revenue).
     Output columns must be:
       genre_id, genre_name, total_revenue, revenue_share_pct
     Sorting:
       revenue_share_pct DESC, genre_name ASC

  5) Monthly revenue trend for the top 1 genre by total revenue:
       - month_start (DATE_TRUNC('month', invoice_date)::date)
       - monthly_revenue
     Output columns must be:
       month_start, monthly_revenue
     Sorting:
       month_start ASC

NOTES:
- Use these joins:
    invoice.invoice_id = invoice_line.invoice_id
    invoice.customer_id = customer.customer_id
    invoice_line.track_id = track.track_id
    track.genre_id = genre.genre_id
- Revenue is:
    invoice_line.unit_price * invoice_line.quantity
- Each section must be clearly labeled with SQL comments.
*/
