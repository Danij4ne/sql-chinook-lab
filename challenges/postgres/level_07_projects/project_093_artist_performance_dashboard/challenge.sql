
/*
PROJECT 093 - ARTIST PERFORMANCE DASHBOARD
Difficulty: PROJECT
Database: Chinook

DESCRIPTION:
Create a performance dashboard that ranks artists and highlights key sales metrics.

REQUIREMENTS:
  1) Calculate artist-level KPIs:
       - Total revenue per artist
       - Total quantity sold per artist
       - Total number of distinct invoices per artist
       - Total number of distinct tracks sold per artist
     Output columns must be:
       artist_id, artist_name, total_revenue, total_quantity_sold, invoice_count, distinct_tracks_sold

  2) Create a ranking table of artists by total revenue.
     Add a window function column:
       - revenue_rank (rank highest revenue = 1)
     Output columns must be:
       revenue_rank, artist_id, artist_name, total_revenue

  3) Return the top 10 artists by total revenue.
     Output columns must be:
       revenue_rank, artist_id, artist_name, total_revenue

  4) Create a monthly revenue trend for the top 1 artist by total revenue:
       - month_start (DATE_TRUNC('month', invoice_date)::date)
       - monthly_revenue
     Output columns must be:
       month_start, monthly_revenue
     Sorting:
       month_start ASC

NOTES:
- Use these joins:
    invoice.invoice_id = invoice_line.invoice_id
    invoice_line.track_id = track.track_id
    track.album_id = album.album_id
    album.artist_id = artist.artist_id
- Revenue is:
    invoice_line.unit_price * invoice_line.quantity
- Each section must be clearly labeled with SQL comments.
*/
