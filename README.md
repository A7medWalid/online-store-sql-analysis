# online-store-sql-analysis
# 🛒 Online Store E-Commerce Analysis (SQL)

Welcome to the **Online Store SQL Analysis** repository. This project contains a complete relational database schema and a suite of T-SQL queries categorized across multiple difficulty levels (from fundamental filtering to complex business analytics)[cite: 5].

---

## 📌 Project Overview

The objective of this project is to model an E-Commerce platform database and perform analytical querying to extract actionable business insights[cite: 5]. It models customer behavior, order processing, inventory tracking, revenue generation, and product performance[cite: 5].

---

## 🗄️ Database Schema & Entities

The database **`OnlineStore`** consists of 5 relational tables[cite: 5]:

- **`Categories`**: Product categories (Electronics, Laptops, Smartphones, Accessories, Gaming)[cite: 5].
- **`Customers`**: Customer profile information including demographic details (City, Country) and signup dates[cite: 5].
- **`Products`**: Product inventory tracking prices, stock levels, and associated categories[cite: 5].
- **`Orders`**: Order header details tracking customer IDs, order dates, and order status (`Completed`, `Pending`, `Cancelled`)[cite: 5].
- **`OrderDetails`**: Transaction details linking products, quantities, and unit prices to specific orders[cite: 5].

---

## 📊 Progressive Analytical Breakdown

The analytical script is structured into 4 distinct skill levels[cite: 5]:

### 🟢 Level 1: Basic Queries
- **Data Retrieval**: Fetching base tables for customers, products, and categories[cite: 5].
- **Threshold Filtering**: Filtering high-value products priced above $20,000[cite: 5].
- **Location & Sorting**: Pattern matching for customer cities (e.g., Mansoura) and price-descending sorting[cite: 5].

### 🟡 Level 2: Aggregations & Grouping
- **Product Metrics**: Calculating average product price, identifying the maximum price, and finding total customer counts[cite: 5].
- **Category Counts**: Aggregating total product offerings per category using `COUNT()` and `GROUP BY`[cite: 5].
- **Sales Volume**: Summarizing total unit sales per product from `OrderDetails`[cite: 5].

### 🟠 Level 3: Relational Joins & Data Assembly
- **Customer Order Tracking**: Joining `Customers` and `Orders` to view order status and dates alongside customer full names[cite: 5].
- **Catalog Assembly**: Joining `Products` and `Categories` to map product items to their parent categories[cite: 5].
- **Line-Item Order Breakdown**: Executing multi-table joins across 4 entities (`OrderDetails`, `Products`, `Orders`, `Customers`) to calculate line-item totals (`Quantity * UnitPrice`)[cite: 5].

### 🔴 Level 4: Business Intelligence & E-Commerce KPIs
- **Financial Revenue**: Calculating overall platform revenue and breaking down total revenue generated per product and category[cite: 5].
- **Top Performers**: Pinpointing the best-selling product by revenue and top 3 customers by lifetime spend[cite: 5].
- **Customer Behavior**: Identifying inactive customers who never placed an order (using `LEFT JOIN` and `IS NULL`) and counting order frequencies per customer[cite: 5].
- **Order Metrics**: Identifying the most popular product category, evaluating average order values, and ranking top highest-value orders[cite: 5].

---

## 🛠️ Tech Stack & Key Concepts

- **Database Engine**: SQL Server / T-SQL[cite: 5]
- **Relational Concepts**: Primary Keys, Foreign Keys, Referential Integrity[cite: 5]
- **T-SQL Functions**: `SUM()`, `AVG()`, `COUNT()`, `MAX()`, `CONCAT()`, `TOP`, `DISTINCT`[cite: 5]
- **Joins**: `INNER JOIN`, `LEFT JOIN`[cite: 5]

---

## 🚀 How to Run

1. **Build Database & Load Data**:
   - Open SSMS or your preferred SQL tool.
   - Run the script `OnlineStore.sql` to execute schema creation, seed dummy data, and run all analytical queries line-by-line[cite: 5].

---

## ✍️ Author

**Eng. Ahmed Walid**  
*Data Science & Artificial Intelligence Student | Computer & Control Systems Engineering Department, Mansoura University.*  
- 🌐 GitHub: [A7medWalid](https://github.com/A7medWalid)
- 💼 LinkedIn: [Ahmed Walid](https://www.linkedin.com/in/ahmed-walid-9o9)
