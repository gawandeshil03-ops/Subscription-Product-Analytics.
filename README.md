# Subscription Product Analytics — Tableau

![Project Flow](assets/project-flow.gif)

> **End-to-end Tableau analytics project:** SQL is used only for data cleaning and preparation; all business analysis and visualization is performed in Tableau.

## Project overview

This project analyzes subscription-product performance from cleaned customer and subscription data. The goal is to provide a practical business view of **conversion, funnel performance, revenue, customer activity, churn, and cohort retention**.

## End-to-end flow

```text
Source Data
    ↓
SQL Data Quality Checks
    ↓
SQL Data Cleaning / Preparation
    ↓
Cleaned Data
    ↓
TABLEAU ANALYSIS
    ├── Executive KPIs
    ├── Conversion
    ├── Funnel
    ├── Revenue / MRR
    ├── Active Customers
    ├── Churn
    └── Cohort Retention
    ↓
Business Insights
```

## Tool responsibilities

| Tool | Responsibility |
|---|---|
| SQL | Data-quality checks and cleaning/preparation only |
| Tableau | All analysis, calculations, charts, dashboards, and business insights |

## Tableau dashboards

### 1. Executive Overview

- Total Users
- Trial Users
- Paid Users
- Paid Conversion Rate
- Subscription Funnel
- Monthly Signup Trend
- Conversion by Acquisition Channel
- Conversion by Country
- Conversion by Device

### 2. Customer & Retention Insights

- Active Customers
- Churn Rate
- Lost MRR
- Churn by Plan
- Cohort Retention

## Tableau worksheets

The workbook contains 14 worksheets supporting the two dashboards. The analytical work is intentionally kept inside Tableau rather than duplicated in SQL.

## Repository structure

```text
subscription-product-analytics/
├── assets/
│   └── project-flow.gif
├── data/
│   ├── raw/
│   ├── cleaned/
│   └── tableau_extracts/
├── docs/
│   ├── dashboard_documentation.md
│   ├── data_cleaning.md
│   ├── data_dictionary.md
│   └── project_scope.md
├── provenance/
│   └── OWNERSHIP_AND_PROVENANCE.md
├── schema/
├── sql/
│   ├── 01_data_quality.sql
│   ├── 02_cleaning.sql
│   └── README.md
├── tableau/
│   ├── subscription_product_analytics_FINAL.twbx
│   ├── subscription_product_analytics_FINAL.twb
│   └── README.md
└── validation/
    └── validation_report.md
```

## Data note

The original raw source files are not redistributed in this repository. The Tableau workbook contains embedded extract data used by the dashboards.

## Provenance note

The repository does not make an unsupported claim about historical authorship of the supplied source workbook. See `provenance/OWNERSHIP_AND_PROVENANCE.md`.

## Final deliverable

Open:

`tableau/subscription_product_analytics_FINAL.twbx`

in Tableau Desktop.

---

**Project principle:** SQL prepares the data. Tableau performs the analysis.
