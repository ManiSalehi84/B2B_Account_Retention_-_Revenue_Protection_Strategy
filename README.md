# 📊 AdventureWorks Sales & B2B Analytics

An end-to-end data analytics project evaluating B2B account health, customer lifetime value (LTV), churn risks, and multi-channel sales performance.

---

## 📌 Project Overview
Maximizing customer lifetime value and identifying revenue leakage are critical for sustainable sales growth. This project analyzes transaction history, customer segmentation, and product performance within the AdventureWorks enterprise database to identify retention bottlenecks, quantify churn risk, and deliver actionable insights through an interactive Power BI dashboard.

### Key Objectives:
* Segment B2B accounts into actionable retention tiers and detect critical recency churn drop-off points.
* Evaluate the relationship between initial order sizes, multi-category purchasing, and long-term customer lifetime value.
* Deliver an executive-level KPI dashboard to optimize sales channel attribution (Direct Web vs. Sales Rep) and regional performance.

---

## 🛠️ Tech Stack & Architecture
* **Database Management:** SQL Server (Data transformations, CTEs, Window Functions (`LAG`), relational views)
* **Business Intelligence:** Power BI (Data modeling, custom JSON theme styling, interactive reporting)
* **Version Control:** Git & GitHub

---

## 📊 Key Findings & Business Insights
* **B2B Account Lifespan:** Single-order accounts represent the highest drop-off rate, whereas accounts progressing to 3+ orders show significantly longer active lifespans and higher LTV.
* **Churn & Recency Signals:** Accounts exceeding a 90-to-180-day ordering gap demonstrate a steep decline in repeat purchase probability, marking a key window for automated re-engagement.
* **Initial Order Impact:** Enterprise accounts with larger initial order values ($5k+) consistently yield higher lifetime order frequency compared to small-tier initial buyers.
* **Cross-Category Engagement:** Multi-category buyers exhibit higher retention rates and significantly higher revenue contributions compared to single-category buyers.

---

## 📈 Dashboard Features
* **Executive Overview:** High-level KPIs including total revenue, order volume, and channel breakdowns (Direct Web vs. Sales Representatives).
* **B2B Retention & Churn Cohorts:** Recency status buckets, retention tier distribution, and inter-order time gap analytics.
* **Product & Regional Analysis:** Granular category/subcategory performance, discount distributions, and territory revenue mapping.

![AdventureWorks Logo](assets/adventure%20works%20logo.png)

---

## ⚠️ Scope & Limitations
* **Primary Scope:** This phase focuses on core financial metrics, regional performance, customer recency thresholds, and historical B2B order behavior.
* **Future Roadmap:** Subsequent iterations will incorporate predictive churn forecasting models and advanced DAX time-intelligence measures to project future cohort revenues.

---

## 📁 Repository Structure
```text
├── assets/
│   ├── adventure works logo.png
│   ├── AdventureWorks2025.bak
│   ├── color_theme.json
│   ├── Customer.xlsx
│   ├── Date.xlsx
│   ├── Product.xlsx
│   ├── Sales.xlsx
│   ├── SalesPerson.xlsx
│   └── Territory.xlsx
├── docs/
│   ├── Report_pdf
│   └── Report_word
├── pbix/
│   └── Adventure_Works_Project.pbix
├── sql/
│   ├── B2B_Account_Churn.sql
│   ├── B2B_Account_Retention_Tier.sql
│   ├── Customer.sql
│   ├── Customer_Type_Breakdown.sql
│   ├── FactSales.sql
│   ├── Initial_Order_Tier.sql
│   ├── Multi_Category_Purchasing.sql
│   ├── Product.sql
│   ├── Product_Category_and_Subcategory.sql
│   ├── Regional_Sales_Performance.sql
│   ├── SalesPerson.sql
│   ├── Sales_Channel_Breakdown.sql
│   └── Territory.sql
└── README.md
```

---

## 👤 Author
**Mani Salehi**  
* [LinkedIn](http://www.linkedin.com/in/mani-salehi-96b054357)  
* [GitHub](https://github.com/ManiSalehi84)
