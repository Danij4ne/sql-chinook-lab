
/*
PROJECT 096 - ALBUM PROFITABILITY STUDY
Difficulty: PROJECT
Database: Chinook

DESCRIPTION:
Analyze album profitability using sales (invoice_line) data and rank albums by performance.

REQUIREMENTS:
  1) Album-level profitability KPIs:
       - Total revenue per album
       - Total quantity sold per album
       - Total number of distinct invoices per album
       - Total number of distinct customers per album
       - Number of tracks in the album
     Output columns must be:
       album_id, album_title, artist_name, total_revenue, total_quantity_sold, invoice_count, customer_count, track_count

  2) Rank albums by total revenue.
     Add a window function column:
       - revenue_rank (highest revenue = 1)
     Output columns must be:
       revenue_rank, album_id, album_title, artist_name, total_revenue

  3) Top 10 albums by total revenue.
     Output columns must be:
       revenue_rank, album_id, album_title, artist_name, total_revenue

  4) Identify "high price albums" where:
       - average track unit_price for the album >= 1.00
     Output columns must be:
       album_id, album_title, avg_track_price
     Sorting:
       avg_track_price DESC, album_title ASC

  5) Monthly revenue trend for the top 1 album by total revenue:
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
    track.album_id = album.album_id
    album.artist_id = artist.artist_id
- Revenue is:
    invoice_line.unit_price * invoice_line.quantity
- Track count per album must come from track table.
- Each section must be clearly labeled with SQL comments.
*/
