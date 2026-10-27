-- Monthly revenue overview.
-- Note: December 2011 is incomplete in the available data.

SELECT
    DATE_TRUNC('month', invoice_date)::date AS month,
    MIN(invoice_date) AS first_recorded_transaction,
    MAX(invoice_date) AS last_recorded_transaction,
    COUNT(DISTINCT invoice_no) AS invoice_count,
    SUM(line_value) AS revenue
FROM sales
WHERE invoice_date >= DATE '2011-11-01'
  AND invoice_date < DATE '2012-01-01'
GROUP BY DATE_TRUNC('month', invoice_date)
ORDER BY month;
