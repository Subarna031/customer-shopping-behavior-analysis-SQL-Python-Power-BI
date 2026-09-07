# Customer Shopping Behavior Analysis

An end-to-end analysis of customer shopping behavior using Python, PostgreSQL, and Power BI — uncovering spending patterns, customer segments, and product performance to guide business decisions.

## 📌 Project Overview

This project analyzes customer shopping behavior using transactional data from 3,900 purchases across various product categories. The goal is to uncover insights into spending patterns, customer segments, product preferences, and subscription behavior to guide strategic business decisions.

## 📊 Dataset Summary

- **Rows:** 3,900
- **Columns:** 18
- **Missing data:** 37 values in the `Review Rating` column

**Key features:**
- **Customer demographics:** Age, Gender, Location, Subscription Status
- **Purchase details:** Item Purchased, Category, Purchase Amount, Season, Size, Color
- **Shopping behavior:** Discount Applied, Promo Code Used, Previous Purchases, Frequency of Purchases, Review Rating, Shipping Type

## 🧹 Data Preparation & Cleaning (Python)

- **Data loading:** Imported the dataset using `pandas`.
- **Initial exploration:** Used `df.info()` and `.describe()` to check structure and summary statistics.
- **Missing data handling:** Imputed missing `Review Rating` values using the median rating of each product category.
- **Column standardization:** Renamed columns to snake_case for consistency and readability.
- **Feature engineering:**
  - Created `age_group` by binning customer ages.
  - Created `purchase_frequency_days` from purchase data.
- **Data consistency check:** Verified redundancy between `discount_applied` and `promo_code_used`; dropped `promo_code_used`.
- **Database integration:** Loaded the cleaned DataFrame into PostgreSQL for SQL-based analysis.

## 🗃️ SQL Analysis (Business Questions)

Structured queries in PostgreSQL were used to answer key business questions:

| # | Question | Key Result |
|---|----------|-----------|
| 1 | Revenue by gender | Male: $157,890 · Female: $75,191 |
| 2 | High-spending discount users | 839 customers spent above average despite using discounts |
| 3 | Top 5 products by rating | Gloves (3.86), Sandals (3.84), Boots (3.82), Hat (3.80), Skirt (3.78) |
| 4 | Standard vs. Express shipping spend | Standard: $58.46 · Express: $60.48 |
| 5 | Subscribers vs. non-subscribers | Subscribers: 1,053 customers, $62,645 revenue · Non-subscribers: 2,847 customers, $170,436 revenue |
| 6 | Most discount-dependent products | Hat (50%), Sneakers (49.66%), Coat (49.07%), Sweater (48.17%), Pants (47.37%) |
| 7 | Customer segmentation | Loyal: 3,116 · Returning: 701 · New: 83 |
| 8 | Top 3 products per category | e.g. Jewelry & Sunglasses (Accessories), Blouse & Pants (Clothing), Sandals & Shoes (Footwear), Jacket & Coat (Outerwear) |
| 9 | Repeat buyers vs. subscription | Non-subscribers: 2,518 repeat buyers · Subscribers: 958 repeat buyers |
| 10 | Revenue by age group | Young Adult: $62,143 · Middle-aged: $59,197 · Adult: $55,978 · Senior: $55,763 |

## 📈 Power BI Dashboard

An interactive Power BI dashboard was built to present these insights visually, with filters for Subscription Status, Gender, Category, and Shipping Type.

<img width="975" height="530" alt="image" src="https://github.com/user-attachments/assets/f41b13ef-0fa4-4d13-aca0-c095b1532e1a" />


**Dashboard highlights:**
- **KPIs:** 3.9K customers, $59.76 average purchase amount, 3.75 average review rating
- **% of Customers by Subscription Status:** 73% not subscribed, 27% subscribed
- **Revenue & Sales by Category:** Clothing leads, followed by Accessories, Footwear, and Outerwear
- **Revenue & Sales by Age Group:** Young Adults contribute the most, followed by Middle-aged, Adult, and Senior groups

🔗 [View Live Dashboard](https://app.powerbi.com/groups/me/reports/247ec17f-ca78-4d3c-8784-ab4f2b6f8d55/14232a81a48fce8a6890?experience=power-bi) 

## 🔍 Key Findings

- Male customers generate roughly **2x the revenue** of female customers ($157,890 vs. $75,191).
- The vast majority of customers (**73%**) are **not** subscribers, yet non-subscribers generate significantly more total revenue — subscription status alone doesn't drive higher spend.
- **Clothing** is the top-performing category in both revenue and sales volume; **Outerwear** is the lowest.
- **Young Adults** are the highest-revenue age group, though the spread across age groups is fairly even.
- Nearly **80% of customers (3,116 of 3,900)** are classified as "Loyal," indicating strong repeat purchase behavior.
- Products like **Hats, Sneakers, and Coats** are heavily discount-dependent, with ~50% of their purchases involving a discount.

## 💡 Business Recommendations

- **Boost Subscriptions** – Promote exclusive benefits for subscribers to convert the 73% non-subscriber base.
- **Customer Loyalty Programs** – Reward repeat buyers to move "Returning" customers into the "Loyal" segment.
- **Review Discount Policy** – Balance sales boosts with margin control, especially for high discount-dependency products.
- **Product Positioning** – Highlight top-rated and best-selling products (Clothing, Accessories) in campaigns.
- **Targeted Marketing** – Focus efforts on high-revenue age groups (Young Adults) and Express-shipping users.

## ⚠️ Limitations

- 37 missing values in `Review Rating` were imputed using category medians, which may slightly smooth true rating variation.
- Analysis is based on a single snapshot of transactional data (3,900 rows) and does not capture seasonality trends over multiple years.

## 🛠️ Tech Stack

- **Python** (pandas, numpy) – data cleaning and feature engineering
- **PostgreSQL** – structured business-question analysis (SQL)
- **Power BI** – interactive dashboard and visualization
