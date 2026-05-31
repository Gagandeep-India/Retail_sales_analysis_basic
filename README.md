# Retail Sales Analysis using SQL

## Project Overview

This project analyzes retail sales data using MySQL. The goal is to perform data cleaning, data exploration, and business analysis using SQL queries.

The dataset contains transaction-level sales records including customer details, product categories, quantities sold, costs, and revenue generated.

## Dataset Information

The dataset contains the following columns:

| Column          | Description                   |
| --------------- | ----------------------------- |
| transactions_id | Unique transaction identifier |
| sale_date       | Date of sale                  |
| sale_time       | Time of sale                  |
| customer_id     | Unique customer identifier    |
| gender          | Customer gender               |
| age             | Customer age                  |
| category        | Product category              |
| quantity        | Number of units sold          |
| price_per_unit  | Price per item                |
| cogs            | Cost of goods sold            |
| total_sale      | Total transaction value       |

## Database Setup

### Create Database

```sql
CREATE DATABASE Retail_sales;
USE Retail_sales;
```

### Create Table

```sql
CREATE TABLE retail_sales(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(20),
    age INT,
    category VARCHAR(20),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```

## Data Cleaning

The following data quality checks were performed:

* Checked for duplicate transaction IDs.
* Identified records containing NULL values.
* Removed incomplete records from the dataset.
* Standardized the column name from `quantiy` to `quantity`.

## Data Exploration

Key exploratory analysis performed:

* Total number of sales transactions.
* Total number of unique customers.
* Total number of product categories.

## Business Questions Solved

### 1. Sales on a Specific Date

Retrieved all transactions made on:

```sql
2022-11-05
```

### 2. Clothing Sales Analysis

Retrieved all Clothing category transactions where:

* Month = November 2022
* Quantity sold > 2

### 3. Category-wise Revenue

Calculated:

* Total sales by category
* Number of orders by category

### 4. Average Age of Beauty Customers

Computed the average age of customers purchasing Beauty products.

### 5. High Value Transactions

Retrieved transactions where:

```sql
total_sale > 1000
```

### 6. Gender-wise Transaction Analysis

Calculated the total number of transactions by:

* Product category
* Gender

### 7. Best Selling Month of Each Year

Used Window Functions and RANK() to identify the month with the highest average sales in each year.

### 8. Top Customers

Identified customers generating the highest total sales revenue.

### 9. Category-wise Customer Count

Calculated the number of unique customers purchasing from each category.

### 10. Shift-wise Order Analysis

Created customer shopping shifts based on transaction time:

| Shift     | Time Range    |
| --------- | ------------- |
| Morning   | Before 12 PM  |
| Afternoon | 12 PM to 5 PM |
| Evening   | After 5 PM    |

Calculated the number of orders placed during each shift.

## SQL Concepts Used

* SELECT
* WHERE
* GROUP BY
* ORDER BY
* Aggregate Functions

  * COUNT()
  * SUM()
  * AVG()
* DISTINCT
* CASE Statements
* Common Table Expressions (CTE)
* Window Functions

  * RANK()
* Date Functions

  * EXTRACT()
  * DATE_FORMAT()

## Key Learnings

Through this project, the following SQL skills were practiced:

* Data Cleaning
* Data Exploration
* Business Analytics
* Window Functions
* CTEs
* Aggregate Analysis
* Time-based Analysis
* Customer Segmentation

## Tools Used

* MySQL
* MySQL Workbench
* SQL

## Project Outcome

The project demonstrates how SQL can be used to clean, explore, and analyze retail sales data to generate business insights related to customers, product categories, sales performance, and purchasing behavior.
