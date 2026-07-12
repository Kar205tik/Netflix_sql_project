# Netflix Movies and TV Shows Data Analysis using SQL

![](logo.png)

## Overview

This project presents a comprehensive SQL-based analysis of Netflix Movies and TV Shows data. Using SQL queries, the project answers real-world business questions, uncovers meaningful insights, and demonstrates practical data analysis techniques commonly used in data analyst roles.

The project covers data exploration, aggregation, filtering, ranking, window functions, Common Table Expressions (CTEs), and string manipulation to solve business problems using SQL.

---

## Objectives

* Analyze the distribution of Movies and TV Shows.
* Identify the most common content ratings.
* Explore content by release year, country, duration, and genre.
* Answer business-driven analytical questions using SQL.
* Demonstrate SQL skills required for Data Analyst interviews and projects.

---

## Dataset

**Source:** Netflix Movies and TV Shows Dataset (Kaggle)

https://www.kaggle.com/datasets/shivamb/netflix-shows

---

## Database Schema

```sql
DROP TABLE IF EXISTS netflix;

CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```

---

# Business Problems Solved

### 1. Count the Number of Movies vs TV Shows

Determine the distribution of Movies and TV Shows available on Netflix.

---

### 2. Find the Most Common Rating for Movies and TV Shows

Identify the most frequently occurring rating for each content type.

---

### 3. List All Movies Released in a Specific Year

Retrieve all movies released in a selected year (Example: 2020).

---

### 4. Find the Top 5 Countries with the Most Content

Analyze which countries contribute the highest amount of Netflix content.

---

### 5. Identify the Longest Movie

Find the movie having the maximum duration.

---

### 6. Find Content Added in the Last Five Years

Retrieve recently added Netflix content.

---

### 7. Find All Movies/TV Shows by a Particular Director

Example: Rajiv Chilaka.

---

### 8. List TV Shows with More Than Five Seasons

Identify long-running TV shows.

---

### 9. Count the Number of Content Items in Each Genre

Analyze genre-wise distribution.

---

### 10. Find the Top Five Years with the Highest Percentage of Netflix Content Released in India

Calculate yearly contribution of Indian content.

---

### 11. List All Documentary Movies

Retrieve all documentary titles.

---

### 12. Find Content Without a Director

Identify records with missing director information.

---

### 13. Find Salman Khan Movies Released in the Last 10 Years

Analyze actor-specific content.

---

### 14. Find the Top 10 Actors Appearing in Indian Netflix Content

Determine actors with the highest number of appearances.

---

### 15. Categorize Content Based on Keywords

Categorize titles as:

* **Bad** → Description contains "Kill" or "Violence"
* **Good** → Otherwise

---

# SQL Concepts Used

* SELECT
* WHERE
* GROUP BY
* ORDER BY
* LIMIT
* Aggregate Functions
* CASE WHEN
* Common Table Expressions (CTEs)
* Window Functions (RANK)
* String Functions
* Date Functions
* UNNEST
* STRING_TO_ARRAY
* SPLIT_PART
* Subqueries

---

# Key Insights

* Movies significantly outnumber TV Shows on Netflix.
* TV-MA is one of the most common content ratings.
* The United States and India contribute a large share of Netflix content.
* Drama, International Movies, and Comedies dominate the platform.
* Several TV Shows have more than five seasons.
* Keyword-based categorization helps identify mature or violent content.

---

# Project Skills Demonstrated

* SQL Query Writing
* Data Cleaning
* Business Problem Solving
* Data Aggregation
* Window Functions
* CTEs
* Analytical Thinking
* Data Exploration
* PostgreSQL

---

# Project Structure

```
Netflix_SQL_Project/
│
├── Netflix Dataset.csv
├── Business Problems.sql
├── Solutions.sql
├── README.md
├── logo.png
└── Screenshots/
```

---

# Author

## Kartik Mittal

**Computer Science & Information Technology Student**

Aspiring **Data Analyst** passionate about SQL, Power BI, Python, and Data Visualization.

This project is part of my Data Analytics portfolio and demonstrates practical SQL skills through real-world business case studies using the Netflix dataset.

I am continuously building projects focused on SQL, Power BI, Python, and Business Intelligence to strengthen my analytical and problem-solving skills.

---

## Connect With Me

* **GitHub:** https://github.com/Kar205tik
* **LinkedIn:** *(Add your LinkedIn profile URL here)*

---

## License

This project is intended for educational and portfolio purposes.
