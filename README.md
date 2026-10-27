# Data Detective: Investigating Online Retail Revenue

## Project Overview

Data Detective investigates revenue patterns in the UCI Online Retail dataset using PostgreSQL and Python. The analysis compares equivalent periods, examines product-level changes, and tests how one unusually large invoice affects the headline conclusion.

**Core question:** Does the observed early-December revenue increase reflect broad-based growth, or is it strongly influenced by an individual transaction?

## Key Findings

- November 2011 revenue was £1,509,496.33. Recorded December revenue was £638,792.68, but December data ends on December 9.
- Comparing November 1–9 with December 1–9, revenue increased from £454,238.30 to £638,792.68 (+40.63%).
- Invoice 581483 recorded £168,469.60 for 80,995 units of PAPER CRAFT, LITTLE BIRDIE.
- Excluding that invoice for sensitivity analysis reduces December revenue to £470,323.08, approximately 3.54% above November.
- In that scenario, December units sold were approximately 0.44% lower than November.
- The invoice accounts for approximately 91.28% of the observed £184,554.38 revenue difference.

## Methodology

1. Prepared the dataset and loaded cleaned records into PostgreSQL.
2. Used SQL to aggregate revenue, units, invoices, and product-level results.
3. Compared matched calendar periods.
4. Investigated invoice-level revenue concentration.
5. Tested the sensitivity of the result by excluding invoice 581483 from one comparison scenario.
6. Created charts with Python, Pandas, and Matplotlib.

## Tools

PostgreSQL, SQL, Python, Pandas, Matplotlib, Google Colab, Git, and GitHub.

## Limitations

- December is incomplete; recorded data ends on December 9.
- Short comparison windows may differ in weekday composition and transaction mix.
- The unusual invoice is not assumed to be fraudulent or erroneous.
- Exclusion is a sensitivity test, not a permanent cleaning decision.
- The analysis is descriptive and does not establish causality.

## Repository Structure

- `sql/` — SQL analysis scripts
- `notebooks/` — analysis notebook
- `visuals/` — exported charts
- `reports/` — additional findings and documentation

## Conclusion

The headline 40.63% revenue increase is highly sensitive to one unusually large transaction. This investigation illustrates the importance of validating aggregate metrics, examining outliers, and testing whether conclusions remain stable under alternative assumptions.

## Dataset

UCI Machine Learning Repository — Online Retail dataset:
https://archive.ics.uci.edu/dataset/352/online+retail
