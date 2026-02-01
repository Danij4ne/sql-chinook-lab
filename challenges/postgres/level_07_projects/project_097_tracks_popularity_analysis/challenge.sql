
/*
PROJECT 097 - TRACKS POPULARITY ANALYSIS
Difficulty: PROJECT
Database: Chinook

DESCRIPTION:
Analyze track popularity using sales data and build multiple ranked tables.

REQUIREMENTS:
  1) Track-level KPIs:
       - Total quantity sold per track
       - Total revenue per track
       - Total number of distinct invoices per track
       - Total number of distinct customers per track
     Output columns must be:
       track_id, track_name, total_quantity_sold, total_revenue, invoice_count, customer_count

  2) Rank tracks by total quantity sold.
     Add a window function column:
       - quantity_rank (highest quantity sold = 1)
     Output columns must be:
       quantity_rank, track_id, track_name, total_quantity_sold

  3) Top 20 tracks by total quantity sold.
     Output columns must be:
       quantity_rank, track_id, track_name, total_quantity_sold

  4) Rank tracks by total revenue.
     Add a window function column:
       - revenue_rank (highest revenue = 1)
     Output columns must be:
       revenue_rank, track_id, track_name, total_revenue

  5) Monthly sales trend for the top 1 track by total quantity sold:
       - month_start (DATE_TRUNC('month', invoice_date)::date)
       - monthly_quantity_sold
       - monthly_revenue
     Output columns must be:
       month_start, monthly_quantity_sold, monthly_revenue
     Sorting:
       month_start ASC

NOTES:
- Use these joins:
    invoice.invoice_id = invoice_line.invoice_id
    invoice.customer_id = customer.customer_id
    invoice_line.track_id = track.track_id
- Revenue is:
    invoice_line.unit_price * invoice_line.quantity
- Each section must be clearly labeled with SQL comments.
*/
