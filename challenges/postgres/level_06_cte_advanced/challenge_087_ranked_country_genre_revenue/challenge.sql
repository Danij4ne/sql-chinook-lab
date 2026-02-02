
/*
CHALLENGE 087 — Top 3 Genres by Revenue per Country

Goal:
Return the top 3 genres by total revenue for each billing country using CTEs.

Instructions:
1) Create a CTE named country_genre_revenue that:
   - queries invoice, invoice_line, track, genre
   - joins:
     - invoice.invoice_id = invoice_line.invoice_id
     - invoice_line.track_id = track.track_id
     - track.genre_id = genre.genre_id
   - groups by:
     - invoice.billing_country
     - genre.name
   - computes:
     - SUM(invoice_line.unit_price * invoice_line.quantity) AS total_revenue
2) Create a CTE named ranked_genres that:
   - selects from country_genre_revenue
   - adds:
     - ROW_NUMBER() OVER (
         PARTITION BY billing_country
         ORDER BY total_revenue DESC, genre_name ASC
       ) AS country_rank
3) Keep only rows where:
   - country_rank <= 3
4) Select exactly these columns (in this order):
   - billing_country
   - genre_name
   - total_revenue
   - country_rank
5) Sort the final result by:
   - billing_country ASC
   - country_rank ASC
   - genre_name ASC

Expected:
A result set with 4 columns:
billing_country, genre_name, total_revenue, country_rank
For each billing country, only the top 3 genres by total_revenue, ordered by billing_country ascending, then country_rank ascending, then genre_name ascending.
*/
