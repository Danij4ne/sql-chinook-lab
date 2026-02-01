
/*
PROJECT 098 - REPEAT CUSTOMERS ANALYSIS
Difficulty: PROJECT
Database: Chinook

DESCRIPTION:
Analyze repeat purchasing behavior and identify customers with recurring purchases.

REQUIREMENTS:
  1) Customer repeat KPIs:
       - Total number of invoices per customer
       - Total revenue per customer
       - First invoice date
       - Last invoice date
     Output columns must be:
       customer_id, first_name, last_name, invoice_count, total_revenue, first_invoice_date, last_invoice_date

  2) Identify repeat customers where:
       - invoice_count >= 3
     Output columns must be:
       customer_id, first_name, last_name, invoice_count, total_revenue

  3) Create a distribution table of customers by invoice_count:
       - invoice_count
       - customer_count
     Sorting:
       invoice_count ASC

  4) Revenue contribution of repeat vs non-repeat customers:
       - customer_type ('repeat' or 'non_repeat')
       - total_revenue
       - revenue_share_pct
     Sorting:
       revenue_share_pct DESC

NOTES:
- Use invoice table as the source of purchase activity.
- Revenue is invoice.total.
- Each section must be clearly labeled with SQL comments.
*/
