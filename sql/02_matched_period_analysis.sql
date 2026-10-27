-- Compare November 1-9 with December 1-9, 2011.
-- The comparison uses equivalent calendar windows.

SELECT
    CASE
        WHEN invoice_date >= DATE '2011-11-01'
         AND invoice_date < DATE '2011-11-10'
            THEN 'November 1-9'
        WHEN invoice_date >= DATE '2011-12-01'
         AND invoice_date < DATE '2011-12-10'
            THEN 'December 1-9'
    END AS period,
    SUM(line_value) AS revenue,
    SUM(quantity) AS units_sold,
    COUNT(DISTINCT invoice_no) AS invoice_count,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM sales
WHERE (
    (invoice_date >= DATE '2011-11-01'
     AND invoice_date < DATE '2011-11-10')
    OR
    (invoice_date >= DATE '2011-12-01'
     AND invoice_date < DATE '2011-12-10')
)
GROUP BY period
ORDER BY MIN(invoice_date);
