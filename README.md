# 🚖 OLA Ride Booking Analytics | SQL & Power BI

An end-to-end business analytics project analysing ride-booking transactions to evaluate business performance, revenue contribution, customer behaviour, vehicle performance and operational efficiency.

Project Type: Business Intelligence & Data Analytics
Domain: Transportation / Ride-Hailing
Tools: MySQL Workbench, SQL, Microsoft Power BI, DAX, Microsoft Excel
Dataset: 20,407 ride-booking records
Analysis Period: July 2024

---

## 📌 Project Overview

This project explores a ride-booking dataset containing approximately **20,407 booking records** from July 2024. The objective is to transform raw booking data into meaningful business insights through data cleaning, exploratory analysis, SQL querying and interactive Power BI dashboards.

This project focuses on analysing ride-booking data to understand the operational and financial performance of a ride-hailing business.

Using MySQL, I performed data preparation, data quality checks and business-oriented SQL analysis. I subsequently developed an interactive five-page Power BI report to transform the analytical results into meaningful visual insights.

The analysis covers booking performance, revenue generation, cancellation patterns, customer activity, payment preferences, vehicle performance, location-based demand and operational efficiency.

The objective was not simply to create dashboards, but to identify potential business problems, understand the factors influencing performance and develop data-driven recommendations that could help improve a ride-hailing business.

## Project at a Glance

| Project Metric | Value |
|:---|---:|
| Total Booking Records | 20,407 |
| Unique Customers | 20,189 |
| Successful Rides | 12,652 |
| Total Successful-Ride Revenue | ₹69,00,234 |
| SQL Analytical Queries | Approximately 30 |
| SQL Result Exports | 29 CSV Files |
| Power BI Report Pages | 5 |

## 🎯 Business Objectives

The primary objectives of this project are:

- Analyse overall ride-booking performance and booking success rates.
- Identify revenue trends across different vehicle categories and payment methods.
- Understand customer booking behaviour, spending patterns and ratings.
- Investigate customer and driver cancellations.
- Identify locations with high booking demand and cancellation rates.
- Analyse vehicle performance, ride distances and turnaround times.
- Understand daily, weekly and hourly booking patterns.
- Develop interactive dashboards to communicate findings and support business decisions.

## 🛠️ Tech Stack

| Technology | Application |
|---|---|
| **MySQL Workbench** | Data importing, cleaning, validation and SQL analysis |
| **SQL** | Data aggregation, business analysis and exploratory queries |
| **Microsoft Power BI** | Interactive dashboards and data visualisation |
| **DAX** | KPI calculations and analytical measures |
| **Microsoft Excel** | Initial data inspection and CSV preparation |

## 📂 Dataset Description

The project uses a ride-booking dataset containing approximately **20,407 records** covering July 2024.

Each record represents a ride-booking transaction and contains information about customers, vehicles, booking outcomes, payment methods, locations and operational metrics.

### Key Dataset Columns

| Column | Description |
|---|---|
| `Date` | Booking date and timestamp |
| `Time` | Booking time |
| `Booking_ID` | Unique booking identifier |
| `Booking_Status` | Booking outcome |
| `Customer_ID` | Customer identifier |
| `Vehicle_Type` | Category of vehicle booked |
| `Pickup_Location` | Starting location of the ride |
| `Drop_Location` | Destination of the ride |
| `V_TAT` | Vehicle turnaround time |
| `C_TAT` | Customer turnaround time |
| `Canceled_Rides_by_Customer` | Customer cancellation information |
| `Canceled_Rides_by_Driver` | Driver cancellation information |
| `Incomplete_Rides` | Incomplete ride indicator |
| `Incomplete_Rides_Reason` | Reason for an incomplete ride |
| `Booking_Value` | Booking amount |
| `Payment_Method` | Payment method used |
| `Ride_Distance` | Ride distance |
| `Driver_Ratings` | Driver rating |
| `Customer_Rating` | Customer rating |

### Booking Status Categories

The dataset contains four major booking outcomes:

- `Success`
- `Canceled by Driver`
- `Canceled by Customer`
- `Driver Not Found`

These categories were used to analyse booking performance and operational efficiency.

## 🧹 Data Cleaning & Preparation

The initial dataset was imported into MySQL Workbench, where a separate analytical table was created.

**Database:** `ola`

**Tables:**

- `bookings` – Original imported dataset.
- `bookings_clean` – Prepared analytical dataset.

### Data Preparation Activities

1. Imported the original CSV dataset into MySQL.
2. Inspected the dataset structure and relevant columns.
3. Created a separate clean table while preserving the original data.
4. Removed irrelevant fields from the analytical table.
5. Checked duplicate records and booking identifiers.
6. Identified missing values across important columns.
7. Validated booking status categories.
8. Checked date, time and numerical data types.
9. Prepared the cleaned table for SQL analysis and Power BI reporting.

**Important data-handling decision:** Missing customer and driver ratings associated with unsuccessful bookings were retained as `NULL` rather than replaced with zero, because an unavailable rating does not represent an actual zero rating.

## 📊 SQL Analysis

Approximately 30 analytical SQL queries were developed to investigate different aspects of ride-booking performance. The results were exported into **29 CSV output files** for further analysis and documentation.

### 1. Business Performance Analysis

- Overall business performance.
- Total booking analysis.
- Booking status distribution.
- Successful bookings by vehicle type.
- Booking success percentage by vehicle category.

### 2. Revenue & Financial Analysis

- Weekly revenue trends.
- Revenue by vehicle type.
- Average booking revenue by payment method.
- Ride distance versus booking value.
- Highest revenue-generating routes.
- Average customer spending.
- Top 10 customers by total spending.
- Customer revenue ranking within vehicle categories.

### 3. Customer Behaviour Analysis

- Customer booking frequency.
- One-time versus repeat customers.
- Top 20 customers by total bookings.
- Top customers by spending.
- Customers with the highest successful bookings.
- Weekly customer retention analysis.
- Average spending per customer.

### 4. Cancellation & Operational Analysis

- Cancellation rate by payment method.
- Cancellation rates by vehicle type.
- Locations with the highest cancellation rates.
- Locations with the highest driver cancellation rates.
- Reasons for incomplete rides.
- Booking success percentage by vehicle type.

### 5. Vehicle & Location Analysis

- Vehicle-wise revenue contribution.
- Vehicle-wise ride distance.
- Vehicle-wise customer ratings.
- Vehicle and customer turnaround times.
- Most successful booking locations.
- Highest revenue-generating routes.
- Restock priority analysis.

### 6. Time-Based Demand Analysis

- Most frequent booking hours.
- Days of the week with the highest demand.
- Weekly revenue comparison.
- Weekly customer activity analysis.

### SQL Concepts Used

The project involved practical application of:

- SELECT, WHERE and ORDER BY
- GROUP BY and HAVING
- Aggregate functions: SUM, AVG, COUNT, MIN and MAX
- CASE WHEN statements
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- DENSE_RANK and ranking
- LAG
- Date and time functions
- Conditional aggregation

## 📈 Power BI Dashboards

The cleaned booking data was connected to Power BI to develop an interactive, multi-page analytical report.

The report contains **five pages**, designed using an OLA-inspired lime-green, white and dark-green colour palette.

### Dashboard 1: Business Overview

**Objective:** Provide a high-level snapshot of overall ride-booking performance.

**Key KPIs:**
- Total Bookings
- Total Revenue
- Successful Rides
- Average Ride Distance

**Visualisations:**
- Daily Booking Trend
- Booking Status Distribution
- Revenue Trend – Successful Rides
- Top 10 Pickup Locations
- Top 10 Drop Locations

**Dashboard Screenshot:**

<!-- Insert Overview dashboard screenshot below -->

![Business Overview Dashboard](images/01_overview.png)

---

### Dashboard 2: Revenue Analysis

**Objective:** Analyse financial performance across vehicle categories, payment methods and locations.

**Visualisations:**
- Weekly Revenue Trend
- Revenue by Vehicle Type
- Revenue by Payment Method
- Daily Revenue Trend – Successful Rides
- Average Ride Distance by Vehicle Type
- Total Revenue by Pickup Location

**Filters:**
- Date Period
- Payment Method
- Vehicle Type

**Dashboard Screenshot:**

<!-- Insert Revenue Analysis dashboard screenshot below -->

![Revenue Analysis Dashboard](images/02_revenue_analysis.png)

---

### Dashboard 3: Operations Analysis

**Objective:** Evaluate booking success, cancellations, incomplete rides and operational demand patterns.

**Key KPIs:**
- Customer Cancellation Rate
- Total Bookings
- Success Rate
- Driver Cancellation Rate
- Successful Rides

**Visualisations:**
- Pickup Location Success Rate
- Unsuccessful Bookings by Status
- Booking by Hour of Day
- Incomplete Rides by Reason

**Filters:**
- Date
- Vehicle Type
- Booking Status

**Dashboard Screenshot:**

<!-- Insert Operations dashboard screenshot below -->

![Operations Dashboard](images/03_operations.png)

---

### Dashboard 4: Customer Behaviour

**Objective:** Understand customer activity, ratings, revenue contribution and booking preferences.

**Visualisations:**
- Active Customers by Day
- Customer Ratings Distribution
- Top 5 Customers by Revenue
- Payment Methods by Booking Status
- Total Bookings by Vehicle Type and Booking Status

**Filters:**
- Date
- Vehicle Type
- Booking Status

**Dashboard Screenshot:**

<!-- Insert Customer Behaviour dashboard screenshot below -->

![Customer Behaviour Dashboard](images/04_customer_behaviour.png)

---

### Dashboard 5: Key Business Insights

**Objective:** Present important findings and business recommendations in a management-friendly format.

This page consolidates the major insights from the analysis into an infographic-style summary.

**Key insight areas:**
- Revenue performance
- Booking success and cancellations
- Payment preferences
- Vehicle-category performance
- Customer booking behaviour
- Location-based performance

**Dashboard Screenshot:**

<!-- Insert Key Insights page screenshot below -->

![Key Business Insights](images/05_key_insights.png)

---

## 📌 Key Business Findings

The following findings were identified from the SQL results and Power BI dashboard.

| Metric | Result |
|---|---:|
| Total Bookings | 20,407 |
| Successful Rides | 12,652 |
| Unique Customers | 20,189 |
| Total Revenue | ₹69,00,234 |
| Booking Success Rate | Approximately 62% |
| Driver Cancellations | 3,654 |
| Repeat Customers | 217 |
| Repeat Customer Rate | Approximately 1.07% |

### Additional Findings

**1. Revenue Contribution**

The dataset generated approximately ₹69 lakh in successful-ride revenue.

**2. Vehicle Performance**

Prime Sedan was the highest-revenue vehicle category in the dashboard, contributing approximately ₹10.56 lakh.

**3. Payment Preferences**

Cash contributed approximately 55.39% of revenue, while UPI contributed approximately 40.05%.

**4. Booking Cancellations**

Driver cancellations accounted for approximately 17.91% of total bookings, highlighting an area for operational investigation.

**5. Customer Activity**

The customer frequency analysis identified 19,972 one-time customers and 217 repeat customers during the observed period.

**6. Location Performance**

Pickup and drop locations showed differences in booking volume and success rates, providing opportunities for location-level operational analysis.

## 💡 Business Recommendations

Based on the analytical findings, the following recommendations can be considered:

1. **Improve Driver Availability:** Investigate driver cancellation patterns and identify locations or periods where driver availability may be insufficient.

2. **Optimise Location-Based Operations:** Monitor pickup locations with lower booking success rates and review driver allocation strategies.

3. **Vehicle Allocation:** Use vehicle-wise revenue and booking performance to support fleet allocation decisions.

4. **Improve Customer Experience:** Investigate lower customer ratings and incomplete ride reasons to identify potential service-quality issues.

5. **Demand-Based Planning:** Use hourly and daily booking patterns to better align driver availability with ride demand.

6. **Payment Strategy:** Monitor payment preferences and evaluate opportunities to improve digital payment adoption.

## 🧮 DAX Measures

Several DAX measures were developed to calculate important business KPIs.

**Total Bookings**

```DAX
Total Bookings =
COUNTROWS('ola bookings_clean')
```

**Successful Rides**

```DAX
Successful Rides =
CALCULATE(
    [Total Bookings],
    'ola bookings_clean'[Booking_Status] = "Success"
)
```

**Success Rate**

```DAX
Success Rate % =
DIVIDE(
    [Successful Rides],
    [Total Bookings],
    0
)
```

**Total Revenue**

```DAX
Total Revenue =
CALCULATE(
    SUM('ola bookings_clean'[Booking_Value]),
    'ola bookings_clean'[Booking_Status] = "Success"
)
```

**Unique Customers**

```DAX
Unique Customers =
DISTINCTCOUNT('ola bookings_clean'[Customer_ID])
```

**Average Customer Rating**

```DAX
Avg Customer Rating =
AVERAGE('ola bookings_clean'[Customer_Rating])
```

Additional measures were developed for customer cancellations, driver cancellations, repeat customers, average booking value, ride distance and other dashboard KPIs.

## 📁 Repository Structure

The recommended GitHub repository structure is:

```text
OLA-Ride-Booking-Analytics/
│
├── Dataset/
│   └── bookings_new.csv
│
├── SQL/
│   ├── data_cleaning.sql
│   ├── business_analysis.sql
│   └── data_quality_checks.sql
│
├── SQL_Outputs/
│   ├── overall_business_performance.csv
│   ├── weekly revenue.csv
│   ├── vehicle type revenue.csv
│   ├── booking status.csv
│   └── ... other SQL output files
│
├── PowerBI/
│   └── ola Final.pbix
│
├── images/
│   ├── 01_overview.png
│   ├── 02_revenue_analysis.png
│   ├── 03_operations.png
│   ├── 04_customer_behaviour.png
│   └── 05_key_insights.png
│
└── README.md
```

*Note: This is the suggested repository structure. Adjust the filenames to match the files you actually upload.*


## 👨‍💻 Author

**Pratham Pulkeet**

Data Analytics Enthusiast | SQL | Power BI | Python

This project demonstrates practical experience in SQL-based data analysis, data preparation, KPI development, DAX and interactive business intelligence reporting.

---

⭐ If you find this project useful, feel free to explore the SQL scripts and Power BI dashboards.

**Thank you for checking out OLA Ride Booking Analytics!**
