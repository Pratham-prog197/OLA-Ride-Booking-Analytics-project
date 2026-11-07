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

## 2. Why I Chose This Project

I selected the ride-hailing industry because it is a data-intensive business where operational efficiency, customer experience, pricing, driver availability and demand management directly influence business performance.

A ride-booking platform generates large amounts of transactional data through customer bookings, vehicle assignments, payment activities, cancellations, ratings and location information.

I wanted to understand how a Data Analyst could use this information to solve practical business problems rather than simply perform basic data analysis.

I specifically chose this project to investigate questions such as:

- Why are some bookings unsuccessful?
- Which vehicle categories contribute the most revenue?
- Which locations experience higher booking demand?
- What factors may contribute to customer and driver cancellations?
- How do booking patterns change throughout the day?
- Which payment methods contribute the most revenue?
- How can operational performance and customer experience be improved?

This project allowed me to apply SQL for extracting business insights and Power BI for communicating those insights through interactive dashboards.

It also provided practical experience in handling transactional datasets, defining business KPIs, performing data validation and converting analytical results into business recommendations.

My objective was to approach the project from the perspective of a Data Analyst working for a ride-hailing company.


## 3. Business Problem & Objectives

Ride-hailing businesses must balance customer demand, driver availability, vehicle utilisation, revenue generation and service quality.

Poor driver availability can result in unsuccessful bookings. High cancellation rates can affect customer experience. Uneven demand across locations and time periods can create operational inefficiencies.

The project investigates these challenges through the following analytical objectives:

| Business Area | Objective |
|:---|:---|
| Business Performance | Evaluate overall booking volume and success rates |
| Revenue Analysis | Identify revenue contribution by vehicle, payment method and location |
| Customer Behaviour | Understand booking frequency, ratings and customer spending |
| Operational Efficiency | Investigate customer and driver cancellations and incomplete rides |
| Vehicle Performance | Compare vehicle categories based on revenue, bookings, ratings, ride distances and turnaround times |
| Demand Analysis | Identify high-demand hours, days and locations, and locations with high cancellation rates |
| Reporting | Develop interactive dashboards to communicate findings and support business decisions |
| Business Improvement | Develop recommendations based on observed patterns |

## 4. 🛠️ Tech Stack

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

## 5. 🧹 Data Cleaning & Preparation

The initial dataset was imported into MySQL Workbench, where a separate analytical table was created.

**Database:** `ola`

**Tables:**

- `bookings_new` – Prepared analytical dataset.

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

## 6. SQL Analysis & Business Questions

Approximately 30 analytical SQL queries were developed to investigate different business areas.

The analysis was organised into six major categories.

### 6.1 Overall Business Performance

Analysed the overall performance of the ride-booking platform.

**Key analyses:**

- Total bookings
- Successful bookings
- Booking status distribution
- Booking success by vehicle type
- Overall business performance

### 6.2 Revenue & Financial Analysis

Investigated the financial performance of different vehicle categories, payment methods, customers and routes.

**Key analyses:**

- Weekly revenue trends
- Revenue by vehicle type
- Average booking revenue by payment method
- Ride distance versus booking value
- Highest revenue-generating routes
- Average customer spending
- Top 10 customers by spending
- Customer revenue ranking within vehicle categories

### 6.3 Customer Behaviour Analysis

Examined how customers interacted with the ride-booking platform.

**Key analyses:**

- Customer booking frequency
- One-time versus repeat customers
- Top 20 customers by booking count
- Top customers by spending
- Customers with the highest successful bookings
- Weekly repeat-customer activity
- Average spending per customer

### 6.4 Cancellation & Operational Analysis

Investigated unsuccessful bookings and operational problems.

**Key analyses:**

- Cancellation rate by payment method
- Cancellation rate by vehicle type
- Locations with the highest cancellation rates
- Locations with the highest driver cancellation rates
- Reasons for incomplete rides
- Successful booking percentage by vehicle type

### 6.5 Vehicle & Location Analysis

Compared vehicle categories and geographical performance.

**Key analyses:**

- Revenue by vehicle category
- Ride distance by vehicle type
- Customer ratings by vehicle category
- Vehicle and customer turnaround times
- Most successful booking locations
- Highest revenue-generating routes
- Restock priority analysis

### 6.6 Time-Based Demand Analysis

Investigated when ride demand was highest.

**Key analyses:**

- Most frequent booking hours
- Days of the week with the highest demand
- Weekly revenue
- Weekly customer activity

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

SQL Deliverables: Approximately 30 analytical queries and 29 exported CSV result files.

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

### Business Questions

- How many bookings were generated?
- How many rides were successful?
- How much revenue was generated?
- How did booking volume change over time?
- Which locations generated the highest pickup and drop demand?

**Dashboard Screenshot:**

<!-- Insert Overview dashboard screenshot below -->
<img width="1585" height="902" alt="Screenshot 2026-11-07 214555" src="https://github.com/user-attachments/assets/39434f23-9fe5-4d38-88cc-89799dc43d53" />



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

### Business Questions

- Which vehicle category contributes the highest revenue?
- Which payment methods generate the most revenue?
- Which pickup locations contribute the most revenue?
- How does revenue change across weeks?
- How does ride distance vary across vehicle categories?

**Dashboard Screenshot:**

<!-- Insert Revenue Analysis dashboard screenshot below -->
<img width="1577" height="889" alt="Screenshot 2026-11-07 214614" src="https://github.com/user-attachments/assets/46f42053-4c6d-4445-b81a-2a73af313a78" />


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

### Business Questions: Operational Efficiency

- What percentage of bookings are successful?
- Are driver cancellations a major operational issue?
- Which locations have lower booking success rates?
- During which hours is booking demand highest?
- What are the major reasons for incomplete rides?

**Dashboard Screenshot:**

<!-- Insert Operations dashboard screenshot below -->
<img width="1582" height="898" alt="Screenshot 2026-11-07 214648" src="https://github.com/user-attachments/assets/3a1b280a-e4fa-4fae-95c5-16f765fa98db" />


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

### Business Questions: Customer & Booking Analysis

- How does customer activity change over time?
- What is the distribution of customer ratings?
- Which customers contribute the highest revenue?
- How do booking outcomes vary by payment method?
- How does booking status vary across vehicle categories?

**Dashboard Screenshot:**

<!-- Insert Customer Behaviour dashboard screenshot below -->
<img width="1584" height="896" alt="Screenshot 2026-11-07 214720" src="https://github.com/user-attachments/assets/f615f044-3a16-4c16-b574-821a9195e07f" />



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
<img width="1574" height="882" alt="Screenshot 2026-11-07 214731" src="https://github.com/user-attachments/assets/64925a6c-725c-43f9-8bd8-07c787bf89c6" />


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


## 9. How Can OLA Improve Its Business?

Based on the analytical findings, the following are my proposed business recommendations.


### 9.1 Reduce Driver Cancellations

**Problem identified:** Driver cancellations represented approximately 17.91% of all bookings.

**Recommended actions:**

- Investigate locations with unusually high driver cancellation rates.
- Monitor driver acceptance and cancellation behaviour.
- Improve driver-to-customer matching.
- Identify peak periods when driver availability is insufficient.
- Investigate whether pickup distance or estimated waiting time contributes to cancellations.

**Expected business benefit:**

- Higher booking completion.
- Better customer experience.
- Reduced operational inefficiency.
- Potentially higher revenue from completed rides.

### 9.2 Improve Driver Allocation Across Locations

**Problem identified:** Pickup success rates vary by location.

**Recommended actions:**

- Identify locations with consistently lower success rates.
- Monitor booking demand by pickup location and hour.
- Allocate more available drivers to areas experiencing higher demand.
- Investigate locations where bookings frequently fail because drivers are unavailable.

**Expected business benefit:**

- Improved pickup success rates.
- Reduced waiting time.
- Better utilisation of available drivers.

### 9.3 Optimise Fleet Allocation by Vehicle Category

**Problem identified:** Vehicle categories contribute differently to booking volume and revenue.

**Recommended actions:**

- Monitor revenue by vehicle type.
- Compare booking demand with vehicle availability.
- Identify high-performing vehicle categories.
- Align fleet availability with demand patterns.
- Evaluate vehicle categories with lower success rates or higher cancellation activity.

**Expected business benefit:**

- Improved fleet utilisation.
- Better revenue opportunities.
- More efficient resource allocation.

### 9.4 Improve Customer Experience

**Problem identified:** Customer ratings and cancellation activity provide opportunities for service-quality analysis.

**Recommended actions:**

- Investigate rides associated with lower customer ratings.
- Analyse incomplete ride reasons.
- Monitor complaints or recurring service issues if additional data becomes available.
- Improve pickup accuracy and communication.
- Monitor waiting-time-related issues.

**Expected business benefit:**

- Better customer satisfaction.
- Fewer service-related cancellations.
- Improved customer experience.

### 9.5 Improve Payment Experience

**Problem identified:** Cash accounts for approximately 55.39% of revenue, while UPI contributes approximately 40.05%.

**Recommended actions:**

- Maintain reliable cash payment support.
- Improve the convenience and reliability of UPI payments.
- Monitor payment failures if transaction-level data becomes available.
- Evaluate customer payment preferences across vehicle categories and locations.

**Expected business benefit:**

- More convenient payment experiences.
- Better payment-channel understanding.
- Improved digital payment adoption opportunities.

### 9.6 Use Demand-Based Driver Planning

**Problem identified:** Booking activity varies across hours and days.

**Recommended actions:**

- Identify peak booking hours.
- Monitor daily demand patterns.
- Align driver availability with expected demand.
- Use historical demand to support shift planning.
- Monitor high-demand pickup locations during peak periods.

**Expected business benefit:**

- Better driver utilisation.
- Reduced driver shortages.
- Improved booking success.
- More efficient operations.

### 9.7 Monitor Customer Engagement

**Problem identified:** The supplied dataset contains a high proportion of one-time customers.

**Recommended actions:**

- Monitor repeat bookings over longer observation periods.
- Analyse customer activity by acquisition date when additional historical data is available.
- Investigate reasons for customers not making subsequent bookings.
- Evaluate customer engagement initiatives using measurable outcomes.

**Expected business benefit:**

- Better understanding of customer behaviour.
- Improved customer engagement.
- More informed retention strategies.

- 


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

## 11. Key Technical Skills Demonstrated

| Skill | Practical Application |
|:---|:---|
| MySQL | Database creation, data import and table preparation |
| SQL | Business analysis and data extraction |
| Data Cleaning | Duplicate checks, missing-value analysis and validation |
| CTEs | Organising multi-step analytical queries |
| Window Functions | Ranking and period comparisons |
| Date Functions | Weekly, daily and hourly analysis |
| DAX | KPI and calculated measure development |
| Power BI | Interactive multi-page reporting |
| Data Visualisation | Trends, distributions, comparisons and rankings |
| Business Analysis | Translating data findings into recommendations |
| Data Storytelling | Communicating insights to business stakeholders |


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

## 15. Conclusion

This project demonstrates how raw transactional data can be transformed into meaningful business intelligence through SQL and Power BI.

By analysing more than 20,000 ride-booking records, I explored business performance, revenue contribution, customer behaviour, cancellations, vehicle performance and operational demand.

The SQL analysis helped identify important patterns, while the Power BI dashboards provided an interactive way to communicate those findings.

Most importantly, the project demonstrates that data analysis is not limited to generating reports. It involves identifying business problems, validating information, interpreting results and proposing practical improvements.

**The ultimate objective was to understand how data-driven decisions can help a ride-hailing business improve booking success, operational efficiency, customer experience and revenue performance.**


## 👨‍💻 Author

**Pratham Pulkeet**

Data Analytics Enthusiast | SQL | Power BI | Python

This project demonstrates practical experience in SQL-based data analysis, data preparation, KPI development, DAX and interactive business intelligence reporting.

---

⭐ If you find this project useful, feel free to explore the SQL scripts and Power BI dashboards.

**Thank you for checking out OLA Ride Booking Analytics!**
