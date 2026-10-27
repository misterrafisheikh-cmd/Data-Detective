-- Sensitivity analysis for invoice 581483.
-- The invoice is excluded only in the alternative scenario;
-- it is not permanently removed from the dataset.

WITH period_sales AS (
    SELECT
        CASE
            WHEN invoice_date >= DATE '2011-11-01'
             AND invoice_date < DATE '2011-11-10'
                THEN 'November 1-9'
            ELSE 'December 1-9'
        END AS period,
        SUM(line_value) AS revenue,
        SUM(quantity) AS units_sold,
        COUNT(DISTINCT invoice_no) AS invoice_count
    FROM sales
    WHERE (
        (invoice_date >= DATE '2011-11-01'
         AND invoice_date < DATE '2011-11-10')
        OR
        (invoice_date >= DATE '2011-12-01'
         AND invoice_date < DATE '2011-12-10')
    )
    GROUP BY period
),
sensitivity_sales AS (
    SELECT
        CASE
            WHEN invoice_date >= DATE '2011-11-01'
             AND invoice_date < DATE '2011-11-10'
                THEN 'November 1-9'
            ELSE 'December 1-9'
        END AS period,
        SUM(line_value) AS revenue,
        SUM(quantity) AS units_sold,
        COUNT(DISTINCT invoice_no) AS invoice_count
    FROM sales
    WHERE (
        (invoice_date >= DATE '2011-11-01'
         AND invoice_date < DATE '2011-11-10')
        OR
        (invoice_date >= DATE '2011-12-01'
         AND invoice_date < DATE '2011-12-10')
    )
      AND invoice_no <> '581483'
    GROUP BY period
)
SELECT
    'All transactions' AS scenario,
    period,
    revenue,
    units_sold,
    invoice_count
FROM period_sales

UNION ALL

SELECT
    'Exclude invoice 581483' AS scenario,
    period,
    revenue,
    units_sold,
    invoice_count
FROM sensitivity_sales
ORDER BY scenario, period;
