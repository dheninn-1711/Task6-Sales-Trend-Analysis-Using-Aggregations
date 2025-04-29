# 📊 Sales Database Analysis — SQL Queries

## 🎯 Objective

The objective of this project is to explore and analyze sales data from a relational database using SQL. The key focus is on extracting **monthly revenue** and **order volume trends** using aggregation functions.
---

## 📁 Overview

This project involves analyzing data from an online sales database. The SQL script explores various tables (`customers`, `orders`, `order_items`, `products`, and `payments`).

---

## 📂 Tables Used

| Table Name    | Description                          |
|---------------|--------------------------------------|
| `customers`   | Contains customer information         |
| `orders`      | Stores order-level data including dates and amounts |
| `order_items` | Details of individual items in each order |
| `products`    | Information about the products sold   |
| `payments`    | Payment transactions for orders       |

---

## 🧾 SQL Query Breakdown

### 🔹 1. View All Tables

```sql
SELECT * FROM customers;
```
![customers_table](https://github.com/user-attachments/assets/cc04a4db-0934-4090-b42b-2d094d09029e)

---

```sql
SELECT * FROM orders;
```
![orders_table](https://github.com/user-attachments/assets/5f9b533e-e92a-4b68-bdb8-e4e50a07feef)

---

```sql
SELECT * FROM order_items;
```
![order_items_table](https://github.com/user-attachments/assets/0c9c27f3-6183-48e1-a426-21e1cbad89ed)

---

```sql
SELECT * FROM products;
```
![products_table](https://github.com/user-attachments/assets/1c7fd4d4-b6c5-4c66-adee-d6c93fead646)

---

```sql
SELECT * FROM payments;
```
![payments_table](https://github.com/user-attachments/assets/110be41d-63b0-4aba-93f6-3a8c08921368)

---

### 🔹 2. Extract Year and Month from Orders

```sql
SELECT 
    order_id,
    order_date,
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    total_amount
FROM 
    Orders
ORDER BY 
    order_id
LIMIT 5;
```
![Extract](https://github.com/user-attachments/assets/eb038fdc-d2b0-4001-9edc-5c6c82e4d822)

---

### 🔹 3. Basic Monthly Aggregation

```sql
SELECT
    SUM(total_amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date);
```
![Aggregates](https://github.com/user-attachments/assets/2332b922-0e49-4686-9324-6c5378a20de1)

---

### 🔹 4. Monthly & Yearly Revenue with Sorting

```sql
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    total_revenue DESC;
```
![Monthly revenue and order volume](https://github.com/user-attachments/assets/4418a016-6dbf-465d-b678-6edc4bbc3b45)

---

### 🔹 5. Limit Results (Top 2 Revenue Months)

```sql
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    total_revenue DESC
LIMIT 2;
```
![Monthly revenue and order volume limit](https://github.com/user-attachments/assets/e811e747-13a6-4c85-9929-2a9863151266)

---

## 🧠 Key Concepts Used
  - `YEAR()` and `MONTH()` functions
  - `GROUP BY` for monthly aggregation
  - `SUM()` and `COUNT(DISTINCT ...)` for metrics
  - `ORDER BY` and `LIMIT` for trend ranking

---

## 📈 Outcome
  - This SQL script demonstrates how to:
  - Explore and understand the structure of an Online_sales database
  - Extract and manipulate date-based data
  - Aggregate and rank revenue and order performance over time
