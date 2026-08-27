# Sales Analytics Dashboard

## Project Overview

This project is an end-to-end sales analytics project that transforms raw transactional sales data into actionable business insights.

The analysis examines sales performance across products, regions, sales representatives, customer types, sales channels, payment methods and discount levels.

The project was developed using **PostgreSQL, SQL, DAX and Power BI**.

The final output is a three-page interactive Power BI dashboard designed to help stakeholders understand sales performance and identify areas for further investigation.

---

## Business Objective

The project aims to answer key business questions, including:

- What is the overall recorded revenue?
- Which products and categories perform best?
- Which regions generate the most revenue?
- Which sales representatives perform best?
- How do sales channels compare?
- Which payment methods generate the most revenue?
- How do new and returning customers compare?
- Which customer types purchase different product categories?
- How are discounts associated with revenue?
- What opportunities exist to improve sales performance?

---

## Tools and Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Data storage and validation |
| SQL | Data analysis and transformation |
| DAX | Power BI measures and calculations |
| Power BI | Dashboard development and visualisation |
| Excel/CSV | Initial data handling |

---

## Project Workflow

```text
Raw Sales Data
      |
      v
Data Preparation
      |
      v
PostgreSQL
      |
      v
SQL Analysis
      |
      v
Reporting View
      |
      v
Power BI
      |
      v
DAX Measures
      |
      v
Interactive Dashboard
      |
      v
Business Insights
```

---

# Dashboard

The dashboard consists of three pages.

## Page 1 — Executive Overview

Provides a high-level summary of sales performance.

### KPIs

- Recorded Revenue
- Total Transactions
- Units Sold
- Average Transaction Value

### Visuals

- Revenue Trend Over Time
- Revenue by Product Category
- Revenue by Region

---

## Page 2 — Sales Performance

Examines sales performance across different business dimensions.

### Visuals

- Revenue by Region and Product
- Revenue by Sales Representative
- Revenue by Sales Channel
- Revenue by Payment Method

---

## Page 3 — Customer and Discount Insights

Examines customer behaviour and discount performance.

### Visuals

- New vs Returning Customer Revenue
- Revenue by Customer
- Customer Type by Product Category
- Revenue by Discount Band

---

# Key Metrics

| Metric | Value |
|---|---:|
| Total Transactions | **1,000** |
| Recorded Revenue | **5,019,265.23** |
| Units Sold | **25,355** |
| Average Transaction Value | **5,019.27** |

---

# Key Insights

### Product Category

**Clothing** was the leading product category by recorded revenue.

### Region

The **North region** generated the highest share of recorded revenue at approximately **27.29%**.

### Customer Type

The customer base is relatively balanced between new and returning customers, with returning customers generating slightly higher recorded revenue.

### Customer Preferences

Clothing was the leading category among new customers, while Furniture was the leading category among returning customers.

### Discounts

The **20–30% discount band** generated the highest recorded revenue.

However, this does not establish that the discount level is the most profitable because the project excludes profitability analysis due to inconsistencies in the underlying cost and revenue fields.

### Sales Channel

Retail generated slightly higher recorded revenue, while Online had a slightly higher average transaction value.

### Payment Method

**Credit Card** generated the highest recorded revenue among the payment methods analysed.

---

# Business Recommendations

Based on the analysis, the business should consider:

1. Investigating the factors behind the North region's stronger performance.
2. Analysing the products driving Clothing category revenue.
3. Strengthening customer retention strategies for returning customers.
4. Investigating different purchasing patterns between new and returning customers.
5. Reviewing discount strategies using validated profitability data.
6. Comparing Retail and Online customers using revenue, transaction volume and average transaction value.
7. Investigating the factors associated with high-performing sales representatives.

---

# Important Data Consideration

The dashboard uses **recorded sales revenue** from the `sales_amount` field as its primary financial metric.

Profitability analysis was deliberately excluded because inconsistencies were identified between the cost and revenue fields.

Therefore, higher recorded revenue should not automatically be interpreted as higher profit.

---

# Limitations

- The analysis focuses on recorded revenue rather than profitability.
- The dataset may not represent all aspects of a real business.
- Observed relationships do not establish causation.
- Further validation would be required before making financial decisions based on profitability.
- The project does not currently include predictive modelling.

---

# Future Improvements

Potential extensions include:

- Validated profit and margin analysis
- Sales forecasting
- Customer segmentation
- Customer lifetime value analysis
- Discount elasticity analysis
- Product profitability
- Regional benchmarking
- Sales representative target analysis
- Predictive sales modelling using Python
- Automated Power BI data refresh

---

# Skills Demonstrated

## Technical

- SQL
- PostgreSQL
- DAX
- Power BI
- Data Cleaning
- Data Validation
- Data Transformation
- Data Visualisation
- Dashboard Development

## Analytical

- Exploratory Data Analysis
- Sales Performance Analysis
- Customer Analysis
- Revenue Analysis
- Segmentation
- KPI Development
- Insight Generation

## Business

- Business Problem Definition
- Stakeholder-Oriented Reporting
- Performance Analysis
- Data-Driven Recommendations
- Translating Data into Business Insights

---

# Suggested Repository Structure

```text
sales-analytics-dashboard/
│
├── README.md
│
├── data/
│   └── sales_data.csv
│
├── sql/
│   ├── create_table.sql
│   ├── data_validation.sql
│   ├── exploratory_analysis.sql
│   └── sales_reporting_view.sql
│
├── powerbi/
│   └── sales_analytics_dashboard.pbix
│
├── documentation/
│   └── sales_project_documentation.pdf
│
└── screenshots/
    ├── executive_overview.png
    ├── sales_performance.png
    └── customer_discount_insights.png
```

---

# Project Status

**Completed**

**Tools:** PostgreSQL | SQL | DAX | Power BI

**Dataset:** 1,000 transaction records

**Dashboard:** 3-page interactive Power BI report
