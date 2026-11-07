create database ola;
use ola;


select *
from bookings_clean
limit 5;

rename table bookings_new to bookings;
-- Check the table structure
DESCRIBE bookings;

CREATE TABLE bookings_clean LIKE bookings;

SELECT
    COUNT(*) AS total_rows,
    COUNT(`Vehicle Images`) AS vehicle_images_non_null
FROM bookings;
ALTER TABLE bookings_clean
DROP COLUMN `Vehicle Images`,
DROP COLUMN `MyUnknownColumn`;

USE ola;

DROP TABLE IF EXISTS bookings_clean;

CREATE TABLE bookings_clean AS
SELECT
    `Date`,
    `Time`,
    Booking_ID,
    Booking_Status,
    Customer_ID,
    Vehicle_Type,
    Pickup_Location,
    Drop_Location,
    V_TAT,
    C_TAT,
    Canceled_Rides_by_Customer,
    Canceled_Rides_by_Driver,
    Incomplete_Rides,
    Incomplete_Rides_Reason,
    Booking_Value,
    Payment_Method,
    Ride_Distance,
    Driver_Ratings,
    Customer_Rating
FROM bookings
WHERE 1 = 0; 
INSERT INTO bookings_clean (
    `Date`,
    `Time`,
    Booking_ID,
    Booking_Status,
    Customer_ID,
    Vehicle_Type,
    Pickup_Location,
    Drop_Location,
    V_TAT,
    C_TAT,
    Canceled_Rides_by_Customer,
    Canceled_Rides_by_Driver,
    Incomplete_Rides,
    Incomplete_Rides_Reason,
    Booking_Value,
    Payment_Method,
    Ride_Distance,
    Driver_Ratings,
    Customer_Rating
)
SELECT DISTINCT
    NULLIF(TRIM(`Date`), ''),
    NULLIF(TRIM(`Time`), ''),
    NULLIF(TRIM(Booking_ID), ''),
    NULLIF(TRIM(Booking_Status), ''),
    NULLIF(TRIM(Customer_ID), ''),
    NULLIF(TRIM(Vehicle_Type), ''),
    NULLIF(TRIM(Pickup_Location), ''),
    NULLIF(TRIM(Drop_Location), ''),
    V_TAT,
    C_TAT,
    NULLIF(TRIM(Canceled_Rides_by_Customer), ''),
    NULLIF(TRIM(Canceled_Rides_by_Driver), ''),
    NULLIF(TRIM(Incomplete_Rides), ''),
    Incomplete_Rides_Reason,
    Booking_Value,
    NULLIF(TRIM(Payment_Method), ''),
    Ride_Distance,
    Driver_Ratings,
    Customer_Rating
FROM bookings;

SELECT COUNT(*) AS cleaned_rows
FROM bookings_clean;

SELECT *
FROM bookings_clean
LIMIT 10;

     SELECT -- counting duplicate
    Booking_ID,
    COUNT(*) AS duplicate_count
FROM bookings_clean
GROUP BY Booking_ID
HAVING COUNT(*) >1;

SELECT *
FROM bookings_clean
WHERE Booking_ID IN (
    SELECT Booking_ID
    FROM (
        SELECT Booking_ID
        FROM bookings_clean
        GROUP BY Booking_ID
        HAVING COUNT(*) > 1
    ) AS duplicates
)
ORDER BY Booking_ID;

SELECT  -- missing values
    COUNT(*) AS total_rows,
    SUM(Booking_ID IS NULL OR TRIM(Booking_ID) = '') AS missing_booking_ids,
    SUM(Customer_ID IS NULL OR TRIM(Customer_ID) = '') AS missing_customer_ids,
	SUM(Booking_Status IS NULL OR TRIM(Booking_Status) = '') AS missing_statuses,
    SUM(Vehicle_Type IS NULL OR TRIM(Vehicle_Type) = '') AS missing_vehicle_types,
    SUM(Booking_Value IS NULL) AS missing_booking_values,
    SUM(Ride_Distance IS NULL) AS missing_ride_distances,
    SUM(Driver_Ratings IS NULL) AS missing_driver_ratings,
    SUM(Customer_Rating IS NULL) AS missing_customer_ratings
FROM bookings_clean;

SELECT *  -- checking negatives
FROM bookings_clean
WHERE Booking_Value < 0
   OR Ride_Distance < 0
   OR V_TAT < 0
   OR C_TAT < 0
   OR Driver_Ratings < 0
   OR Driver_Ratings > 5
   OR Customer_Rating < 0
   OR Customer_Rating > 5;
   
   
   USE ola;

SELECT
    Booking_Status,
    COUNT(*) AS total_bookings,
    SUM(Driver_Ratings IS NULL) AS missing_driver_ratings,
    SUM(Customer_Rating IS NULL) AS missing_customer_ratings
FROM bookings_clean
GROUP BY Booking_Status
ORDER BY total_bookings DESC;

SELECT
    COUNT(*) AS total_rows,

    SUM(
        Driver_Ratings IS NULL
        AND Customer_Rating IS NULL
    ) AS both_ratings_missing,

    SUM(
        Driver_Ratings IS NULL
        AND Customer_Rating IS NOT NULL
    ) AS only_driver_rating_missing,

    SUM(
        Driver_Ratings IS NOT NULL
        AND Customer_Rating IS NULL
    ) AS only_customer_rating_missing,

    SUM(
        Driver_Ratings IS NOT NULL
        AND Customer_Rating IS NOT NULL
    ) AS both_ratings_available

FROM bookings_clean;
-- Count total records
SELECT COUNT(*) AS total_rows
FROM bookings;


SELECT *
FROM bookings_clean
WHERE (Driver_Ratings IS NOT NULL
       AND (Driver_Ratings < 1 OR Driver_Ratings > 5))
   OR (Customer_Rating IS NOT NULL
       AND (Customer_Rating < 1 OR Customer_Rating > 5));

SELECT *
FROM bookings_clean
WHERE (Driver_Ratings IS NOT NULL
       AND (Driver_Ratings < 1 OR Driver_Ratings > 5))
   OR (Customer_Rating IS NOT NULL
       AND (Customer_Rating < 1 OR Customer_Rating > 5));
       
SELECT
    Booking_ID,
    COUNT(*) AS occurrences
FROM bookings_clean
GROUP BY Booking_ID
HAVING COUNT(*) > 1;

SELECT
    COUNT(*) AS total_rows,

    SUM(Booking_ID IS NULL) AS missing_booking_id,
    SUM(Customer_ID IS NULL) AS missing_customer_id,
    SUM(Booking_Status IS NULL) AS missing_status,
    SUM(Vehicle_Type IS NULL) AS missing_vehicle_type,
    SUM(Booking_Value IS NULL) AS missing_booking_value,
    SUM(Ride_Distance IS NULL) AS missing_ride_distance,
    SUM(Driver_Ratings IS NULL) AS missing_driver_rating,
    SUM(Customer_Rating IS NULL) AS missing_customer_rating

FROM bookings_clean;
-- Check for duplicate booking IDs
SELECT
    Booking_ID,
    COUNT(*) AS occurrences
FROM bookings_clean
GROUP BY Booking_ID
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

-- Check booking statuses
SELECT
    Booking_Status,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY Booking_Status
ORDER BY total_bookings DESC;

ALTER TABLE bookings_new
MODIFY COLUMN Booking_Value DECIMAL(10,2) NULL;

SHOW DATABASES;


select count( *)
FROM bookings;
drop table bookings;

-- above we have cleaned our data

-- Q1. What is the overall business performance?
SELECT
    COUNT(*) AS total_bookings,

    COUNT(DISTINCT Customer_ID) AS unique_customers,

    SUM(CASE
        WHEN Booking_Status = 'Success' THEN 1
        ELSE 0
    END) AS successful_bookings,

    SUM(CASE
        WHEN Booking_Status = 'Canceled by Customer' THEN 1
        ELSE 0
    END) AS customer_cancellations,

    SUM(CASE
        WHEN Booking_Status = 'Canceled by Driver' THEN 1
        ELSE 0
    END) AS driver_cancellations,

    ROUND(
        100.0 * SUM(CASE
            WHEN Booking_Status = 'Success' THEN 1
            ELSE 0
        END) / NULLIF(COUNT(*), 0),
        2
    ) AS booking_success_rate_pct,

    ROUND(
        SUM(CASE
            WHEN Booking_Status = 'Success'
            THEN Booking_Value
            ELSE 0
        END),
        2
    ) AS successful_booking_revenue

FROM bookings_clean;


-- Q2. Which vehicle types generate the most revenue?
WITH vehicle_performance AS (
    SELECT
        Vehicle_Type,
        COUNT(*) AS successful_rides,
        SUM(Booking_Value) AS total_revenue,
        AVG(Booking_Value) AS avg_booking_value,
        AVG(Ride_Distance) AS avg_ride_distance
    FROM bookings_clean
    WHERE Booking_Status = 'Success'
    GROUP BY Vehicle_Type
)
SELECT
    Vehicle_Type,
    successful_rides,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(avg_booking_value, 2) AS avg_booking_value,
    ROUND(avg_ride_distance, 2) AS avg_ride_distance,

    ROUND(
        100.0 * total_revenue /
        NULLIF(SUM(total_revenue) OVER (), 0),
        2
    ) AS revenue_contribution_pct,

    DENSE_RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS revenue_rank

FROM vehicle_performance
ORDER BY revenue_rank;




-- Q3. How much revenue is generated each week?

SELECT
    YEAR(Date) AS booking_year,
    WEEK(Date, 3) AS booking_week,
    MIN(DATE(Date)) AS week_start_date,
    MAX(DATE(Date)) AS latest_booking_date,

    COUNT(*) AS total_bookings,

    SUM(
        CASE
            WHEN Booking_Status = 'Success' THEN 1
            ELSE 0
        END
    ) AS successful_bookings,

    ROUND(
        SUM(
            CASE
                WHEN Booking_Status = 'Success'
                THEN Booking_Value
                ELSE 0
            END
        ), 2
    ) AS weekly_revenue,

    ROUND(
        AVG(
            CASE
                WHEN Booking_Status = 'Success'
                THEN Booking_Value
            END
        ), 2
    ) AS avg_successful_booking_value

FROM bookings_clean

GROUP BY
    YEAR(Date),
    WEEK(Date, 3)

ORDER BY
    booking_year,
    booking_week;
    
    
    
-- Q4. What percentage of bookings are successfully completed?
SELECT
    Vehicle_Type,

    COUNT(*) AS total_bookings,

    SUM(CASE
        WHEN Booking_Status = 'Success' THEN 1
        ELSE 0
    END) AS successful_bookings,

    ROUND(
        100.0 * SUM(CASE
            WHEN Booking_Status = 'Success' THEN 1
            ELSE 0
        END) / NULLIF(COUNT(*), 0),
        2
    ) AS success_rate_pct

FROM bookings_clean
GROUP BY Vehicle_Type
ORDER BY success_rate_pct DESC;


-- Q5. What is the average booking value by payment method?
SELECT
    Payment_Method,

    COUNT(*) AS successful_transactions,

    ROUND(
        SUM(Booking_Value),
        2
    ) AS total_revenue,

    ROUND(
        AVG(Booking_Value),
        2
    ) AS avg_booking_value

FROM bookings_clean
WHERE Booking_Status = 'Success'
GROUP BY Payment_Method
ORDER BY total_revenue DESC;


-- Q6. Which pickup locations generate the most successful bookings?
SELECT
    Pickup_Location,

    COUNT(*) AS successful_bookings,

    COUNT(DISTINCT Customer_ID) AS unique_customers,

    ROUND(
        SUM(Booking_Value),
        2
    ) AS total_revenue,

    ROUND(
        AVG(Ride_Distance),
        2
    ) AS avg_ride_distance

FROM bookings_clean
WHERE Booking_Status = 'Success'
GROUP BY Pickup_Location
ORDER BY successful_bookings DESC
LIMIT 10;


--  Part 2: Customer Analytics

-- Q7. Who are the top 10 customers by total spending?
SELECT
    Customer_ID,

    COUNT(*) AS successful_rides,

    ROUND(
        SUM(Booking_Value),
        2
    ) AS total_customer_spending,

    ROUND(
        AVG(Booking_Value),
        2
    ) AS avg_booking_value,

    ROUND(
        SUM(Ride_Distance),
        2
    ) AS total_distance

FROM bookings_clean
WHERE Booking_Status = 'Success'
GROUP BY Customer_ID
ORDER BY total_customer_spending DESC
LIMIT 10;

-- Q8. Which customers book rides most frequently?
SELECT
    Customer_ID,
    COUNT(*) AS total_bookings,

    SUM(
        CASE
            WHEN Booking_Status = 'Success' THEN 1
            ELSE 0
        END
    ) AS successful_rides,

    ROUND(
        AVG(
            CASE
                WHEN Booking_Status = 'Success'
                THEN Booking_Value
            END
        ), 2
    ) AS avg_successful_booking_value

FROM bookings_clean
GROUP BY Customer_ID
HAVING total_bookings >= 5
ORDER BY successful_rides DESC, total_bookings DESC
LIMIT 20;

-- Q9. How many customers are one-time versus repeat customers?
WITH customer_activity AS (
    SELECT
        Customer_ID,

        COUNT(*) AS total_bookings,

        SUM(CASE
            WHEN Booking_Status = 'Success' THEN 1
            ELSE 0
        END) AS successful_rides

    FROM bookings_clean
    GROUP BY Customer_ID
)
SELECT
    CASE
        WHEN successful_rides = 1
            THEN 'One Successful Ride'
        WHEN successful_rides > 1
            THEN 'Repeat Customer'
        ELSE 'No Successful Rides'
    END AS customer_segment,

    COUNT(*) AS customer_count,

    ROUND(
        100.0 * COUNT(*) /
        NULLIF(SUM(COUNT(*)) OVER (), 0),
        2
    ) AS customer_percentage

FROM customer_activity
GROUP BY
    CASE
        WHEN successful_rides = 1
            THEN 'One Successful Ride'
        WHEN successful_rides > 1
            THEN 'Repeat Customer'
        ELSE 'No Successful Rides'
    END
ORDER BY customer_count DESC;


-- Q10. Which customers have the highest cancellation rates?
SELECT
    Customer_ID,
    total_bookings,
    customer_cancelled_bookings,
    ROUND(100.0 * customer_cancelled_bookings / total_bookings, 2) AS customer_cancellation_rate_pct
FROM (
    SELECT
        Customer_ID,
        COUNT(*) AS total_bookings,
        SUM(CASE WHEN Booking_Status = 'Canceled by Customer' THEN 1 ELSE 0 END) AS customer_cancelled_bookings
    FROM bookings_clean
    GROUP BY Customer_ID
) AS t
WHERE total_bookings >= 5
ORDER BY customer_cancellation_rate_pct DESC,
         total_bookings DESC
LIMIT 20;	

-- Q11. What is the average spending per customer?
WITH customer_revenue AS (
    SELECT
        Customer_ID,
        SUM(Booking_Value) AS customer_revenue
    FROM bookings_clean
    WHERE Booking_Status = 'Success'
    GROUP BY Customer_ID
)
SELECT
    COUNT(*) AS customers_with_successful_rides,

    ROUND(
        AVG(customer_revenue),
        2
    ) AS avg_revenue_per_customer,

    ROUND(
        MIN(customer_revenue),
        2
    ) AS minimum_customer_revenue,

    ROUND(
        MAX(customer_revenue),
        2
    ) AS maximum_customer_revenue,

    ROUND(
        SUM(customer_revenue),
        2
    ) AS total_revenue

FROM customer_revenue;

-- Q12. Which customers have not booked another ride after their first successful ride?
WITH customer_activity AS (
    SELECT
        Customer_ID,

        SUM(CASE
            WHEN Booking_Status = 'Success' THEN 1
            ELSE 0
        END) AS successful_rides,

        MIN(CASE
            WHEN Booking_Status = 'Success' THEN Date
        END) AS first_successful_ride_date,

        MAX(CASE
            WHEN Booking_Status = 'Success' THEN Date
        END) AS last_successful_ride_date

    FROM bookings_clean
    GROUP BY Customer_ID
)
SELECT
    Customer_ID,
    successful_rides,
    first_successful_ride_date,
    last_successful_ride_date

FROM customer_activity
WHERE successful_rides = 1
ORDER BY first_successful_ride_date;


-- Part 3: Cancellation and Operational Analysis
-- Q13. What are the cancellation rates by vehicle type?
SELECT
    Vehicle_Type,

    COUNT(*) AS total_bookings,

    SUM(CASE
        WHEN Booking_Status = 'Canceled by Customer'
        THEN 1
        ELSE 0
    END) AS customer_cancellations,

    SUM(CASE
        WHEN Booking_Status = 'Canceled by Driver'
        THEN 1
        ELSE 0
    END) AS driver_cancellations,

    ROUND(
        100.0 * SUM(CASE
            WHEN Booking_Status IN (
                'Canceled by Customer',
                'Canceled by Driver'
            )
            THEN 1
            ELSE 0
        END) / NULLIF(COUNT(*), 0),
        2
    ) AS overall_cancellation_rate_pct

FROM bookings_clean
GROUP BY Vehicle_Type
ORDER BY overall_cancellation_rate_pct DESC;

-- Q14. What are the most common reasons for incomplete rides?
SELECT
    Incomplete_Rides_Reason,

    COUNT(*) AS incomplete_ride_count,

    ROUND(
        100.0 * COUNT(*) /
        NULLIF(
            SUM(COUNT(*)) OVER (),
            0
        ),
        2
    ) AS percentage_of_incomplete_rides

FROM bookings_clean
WHERE Incomplete_Rides = 'Yes'
  AND Incomplete_Rides_Reason IS NOT NULL
  AND TRIM(Incomplete_Rides_Reason) <> ''

GROUP BY Incomplete_Rides_Reason
ORDER BY incomplete_ride_count DESC;

-- Q15. Which locations have the highest customer cancellation rates?
SELECT
    Pickup_Location,

    COUNT(*) AS total_bookings,

    SUM(CASE
        WHEN Booking_Status = 'Canceled by Customer'
        THEN 1
        ELSE 0
    END) AS customer_cancellations,

    ROUND(
        100.0 * SUM(CASE
            WHEN Booking_Status = 'Canceled by Customer'
            THEN 1
            ELSE 0
        END) / NULLIF(COUNT(*), 0),
        2
    ) AS customer_cancellation_rate_pct

FROM bookings_clean
GROUP BY Pickup_Location
HAVING COUNT(*) >= 50
ORDER BY customer_cancellation_rate_pct DESC;

-- Q16. Which locations have the highest driver cancellation rates?
SELECT
    Pickup_Location,

    COUNT(*) AS total_bookings,

    SUM(CASE
        WHEN Booking_Status = 'Canceled by Driver'
        THEN 1
        ELSE 0
    END) AS driver_cancellations,

    ROUND(
        100.0 * SUM(CASE
            WHEN Booking_Status = 'Canceled by Driver'
            THEN 1
            ELSE 0
        END) / NULLIF(COUNT(*), 0),
        2
    ) AS driver_cancellation_rate_pct

FROM bookings_clean
GROUP BY Pickup_Location
HAVING COUNT(*) >= 50
ORDER BY driver_cancellation_rate_pct DESC;

-- Q17. What proportion of bookings are incomplete, cancelled, or successful?
SELECT
    Booking_Status,

    COUNT(*) AS booking_count,

    ROUND(
        100.0 * COUNT(*) /
        NULLIF(SUM(COUNT(*)) OVER (), 0),
        2
    ) AS booking_percentage

FROM bookings_clean
GROUP BY Booking_Status
ORDER BY booking_count DESC;

-- Q18. How do vehicle and customer turnaround times vary by vehicle type?
SELECT
    Vehicle_Type,

    COUNT(*) AS total_bookings,

    ROUND(
        AVG(CASE
            WHEN Booking_Status = 'Success'
            THEN V_TAT
        END),
        2
    ) AS avg_vehicle_tat_successful,

    ROUND(
        AVG(CASE
            WHEN Booking_Status = 'Success'
            THEN C_TAT
        END),
        2
    ) AS avg_customer_tat_successful,

    ROUND(
        AVG(CASE
            WHEN Booking_Status = 'Success'
            THEN Ride_Distance
        END),
        2
    ) AS avg_successful_ride_distance

FROM bookings_clean
GROUP BY Vehicle_Type
ORDER BY avg_vehicle_tat_successful DESC;

-- Part 4: Driver and Vehicle Performance
-- Q19. Which vehicle types receive the highest customer ratings?
SELECT
    Vehicle_Type,

    COUNT(Customer_Rating) AS rated_bookings,

    ROUND(
        AVG(Customer_Rating),
        2
    ) AS avg_customer_rating,

    ROUND(
        MIN(Customer_Rating),
        2
    ) AS min_customer_rating,

    ROUND(
        MAX(Customer_Rating),
        2
    ) AS max_customer_rating

FROM bookings_clean
WHERE Booking_Status = 'Success'
GROUP BY Vehicle_Type
ORDER BY avg_customer_rating DESC;

-- Q20. Which vehicle types have the highest driver ratings?
SELECT
    Vehicle_Type,

    COUNT(Driver_Ratings) AS rated_bookings,

    ROUND(
        AVG(Driver_Ratings),
        2
    ) AS avg_driver_rating,

    ROUND(
        MIN(Driver_Ratings),
        2
    ) AS min_driver_rating,

    ROUND(
        MAX(Driver_Ratings),
        2
    ) AS max_driver_rating

FROM bookings_clean
WHERE Booking_Status = 'Success'
GROUP BY Vehicle_Type
ORDER BY avg_driver_rating DESC;

-- Q21. Which vehicle types have the longest average ride distances?
SELECT
    Vehicle_Type,

    COUNT(*) AS successful_rides,

    ROUND(
        AVG(Ride_Distance),
        2
    ) AS avg_ride_distance,

    ROUND(
        MIN(Ride_Distance),
        2
    ) AS min_ride_distance,

    ROUND(
        MAX(Ride_Distance),
        2
    ) AS max_ride_distance,

    ROUND(
        SUM(Ride_Distance),
        2
    ) AS total_ride_distance

FROM bookings_clean
WHERE Booking_Status = 'Success'
GROUP BY Vehicle_Type
ORDER BY avg_ride_distance DESC;

-- Q22. What is the relationship between ride distance and booking value?

SELECT
    CASE
        WHEN Ride_Distance < 5 THEN 'Under 5 km'
        WHEN Ride_Distance < 10 THEN '5-10 km'
        WHEN Ride_Distance < 20 THEN '10-20 km'
        ELSE '20+ km'
    END AS distance_band,

    COUNT(*) AS successful_rides,

    ROUND(
        AVG(Booking_Value),
        2
    ) AS avg_booking_value,

    ROUND(
        AVG(Ride_Distance),
        2
    ) AS avg_ride_distance,

    ROUND(
        AVG(
            Booking_Value /
            NULLIF(Ride_Distance, 0)
        ),
        2
    ) AS avg_booking_value_per_distance_unit

FROM bookings_clean
WHERE Booking_Status = 'Success'
  AND Ride_Distance IS NOT NULL
  AND Ride_Distance > 0
GROUP BY
    CASE
        WHEN Ride_Distance < 5 THEN 'Under 5 km'
        WHEN Ride_Distance < 10 THEN '5-10 km'
        WHEN Ride_Distance < 20 THEN '10-20 km'
        ELSE '20+ km'
    END
ORDER BY
    MIN(Ride_Distance);
    
--  Part 5: Advanced SQL and Business Intelligence

-- Q23. How does revenue change month over month?
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(Date, '%Y-%m-01') AS month_start,
        SUM(Booking_Value) AS revenue
    FROM bookings_clean
    WHERE Booking_Status = 'Success'
    GROUP BY DATE_FORMAT(Date, '%Y-%m-01')
),
revenue_comparison AS (
    SELECT
        month_start,
        revenue,
        LAG(revenue) OVER (
            ORDER BY month_start
        ) AS previous_month_revenue
    FROM monthly_revenue
)
SELECT
    month_start,

    ROUND(revenue, 2) AS current_month_revenue,

    ROUND(previous_month_revenue, 2)
        AS previous_month_revenue,

    ROUND(
        100.0 * (revenue - previous_month_revenue) /
        NULLIF(previous_month_revenue, 0),
        2
    ) AS revenue_growth_pct

FROM revenue_comparison
ORDER BY month_start;

-- Q24. Which customers rank highest in revenue within each vehicle category?
WITH customer_vehicle_revenue AS (
    SELECT
        Customer_ID,
        Vehicle_Type,
        COUNT(*) AS successful_rides,
        SUM(Booking_Value) AS total_revenue
    FROM bookings_clean
    WHERE Booking_Status = 'Success'
    GROUP BY
        Customer_ID,
        Vehicle_Type
),
ranked_customers AS (
    SELECT
        Customer_ID,
        Vehicle_Type,
        successful_rides,
        total_revenue,

        DENSE_RANK() OVER (
            PARTITION BY Vehicle_Type
            ORDER BY total_revenue DESC
        ) AS customer_rank

    FROM customer_vehicle_revenue
)
SELECT
    Customer_ID,
    Vehicle_Type,
    successful_rides,
    ROUND(total_revenue, 2) AS total_revenue,
    customer_rank
FROM ranked_customers
WHERE customer_rank <= 5
ORDER BY Vehicle_Type, customer_rank;


-- 25. During which hours are bookings most frequent?
SELECT
    HOUR(Time) AS booking_hour,

    COUNT(*) AS total_bookings,

    SUM(CASE
        WHEN Booking_Status = 'Success' THEN 1
        ELSE 0
    END) AS successful_bookings,

    ROUND(
        100.0 * SUM(CASE
            WHEN Booking_Status = 'Success' THEN 1
            ELSE 0
        END) / NULLIF(COUNT(*), 0),
        2
    ) AS success_rate_pct,

    ROUND(
        SUM(CASE
            WHEN Booking_Status = 'Success'
            THEN Booking_Value
            ELSE 0
        END),
        2
    ) AS successful_revenue

FROM bookings_clean
WHERE Time IS NOT NULL
GROUP BY HOUR(Time)
ORDER BY total_bookings DESC;

-- Q26. Which days of the week have the highest demand?
SELECT
    DAYNAME(Date) AS day_name,

    DAYOFWEEK(Date) AS day_number,

    COUNT(*) AS total_bookings,

    SUM(CASE
        WHEN Booking_Status = 'Success' THEN 1
        ELSE 0
    END) AS successful_bookings,

    ROUND(
        SUM(CASE
            WHEN Booking_Status = 'Success'
            THEN Booking_Value
            ELSE 0
        END),
        2
    ) AS successful_revenue

FROM bookings_clean
GROUP BY
    DAYNAME(Date),
    DAYOFWEEK(Date)
ORDER BY day_number;

-- Q27. Which pickup-to-drop-off routes generate the most revenue?
SELECT
    Pickup_Location,
    Drop_Location,

    COUNT(*) AS successful_rides,

    ROUND(
        SUM(Booking_Value),
        2
    ) AS total_revenue,

    ROUND(
        AVG(Booking_Value),
        2
    ) AS avg_booking_value,

    ROUND(
        AVG(Ride_Distance),
        2
    ) AS avg_ride_distance

FROM bookings_clean
WHERE Booking_Status = 'Success'
  AND Pickup_Location IS NOT NULL
  AND Drop_Location IS NOT NULL

GROUP BY
    Pickup_Location,
    Drop_Location

HAVING COUNT(*) >= 10

ORDER BY total_revenue DESC
LIMIT 20;

-- Q28. Which payment methods have the highest cancellation rates?
SELECT
    Payment_Method,

    COUNT(*) AS total_bookings,

    SUM(
        CASE
            WHEN LOWER(TRIM(Booking_Status)) IN (
                'canceled by customer',
                'canceled by driver'
            )
            THEN 1
            ELSE 0
        END
    ) AS cancelled_bookings,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN LOWER(TRIM(Booking_Status)) IN (
                    'canceled by customer',
                    'canceled by driver'
                )
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS cancellation_rate_pct

FROM bookings_clean
WHERE Payment_Method IS NOT NULL
GROUP BY Payment_Method
HAVING COUNT(*) >= 0
ORDER BY cancellation_rate_pct DESC;



-- Part 6: Data Quality, Customer Retention, and Advanced Analys 
-- Q29. What data-quality issues exist in the booking dataset?
SELECT
    COUNT(*) AS total_rows,

    SUM(
        CASE
            WHEN Booking_ID IS NULL
              OR TRIM(CAST(Booking_ID AS CHAR)) = ''
            THEN 1
            ELSE 0
        END
    ) AS missing_booking_ids,

    SUM(
        CASE
            WHEN Customer_ID IS NULL
              OR TRIM(CAST(Customer_ID AS CHAR)) = ''
            THEN 1
            ELSE 0
        END
    ) AS missing_customer_ids,

    SUM(
        CASE
            WHEN Date IS NULL
            THEN 1
            ELSE 0
        END
    ) AS missing_dates,

    SUM(
        CASE
            WHEN Vehicle_Type IS NULL
              OR TRIM(Vehicle_Type) = ''
            THEN 1
            ELSE 0
        END
    ) AS missing_vehicle_types,

    SUM(
        CASE
            WHEN Booking_Value IS NULL
              OR Booking_Value < 0
            THEN 1
            ELSE 0
        END
    ) AS missing_or_negative_booking_values,

    SUM(
        CASE
            WHEN Ride_Distance IS NULL
              OR Ride_Distance < 0
            THEN 1
            ELSE 0
        END
    ) AS missing_or_negative_ride_distances

FROM bookings_clean;

-- duplicate booking IDs:
SELECT
    Booking_ID,
    COUNT(*) AS occurrences
FROM bookings_clean
GROUP BY Booking_ID
HAVING  occurrences > 1
ORDER BY occurrences DESC;

-- Q30. What is the wwekly  customer retention rate?


WITH customer_weekly_activity AS (
    SELECT DISTINCT
        Customer_ID,
        DATE_SUB(
            DATE(`Date`),
            INTERVAL WEEKDAY(DATE(`Date`)) DAY
        ) AS week_start
    FROM bookings_clean
    WHERE Customer_ID IS NOT NULL
      AND `Date` IS NOT NULL
),

weekly_retention AS (
    SELECT
        previous_week.week_start,
        COUNT(DISTINCT previous_week.Customer_ID)
            AS previous_week_customers,

        COUNT(DISTINCT current_week.Customer_ID)
            AS retained_customers

    FROM customer_weekly_activity previous_week

    LEFT JOIN customer_weekly_activity current_week
        ON previous_week.Customer_ID = current_week.Customer_ID
        AND current_week.week_start =
            DATE_ADD(previous_week.week_start, INTERVAL 7 DAY)

    GROUP BY previous_week.week_start
)

SELECT
    week_start,
    DATE_ADD(week_start, INTERVAL 6 DAY) AS week_end,

    previous_week_customers,
    retained_customers,

    ROUND(
        100.0 * retained_customers /
        NULLIF(previous_week_customers, 0),
        2
    ) AS retention_rate_pct

FROM weekly_retention
ORDER BY week_start;

-- 31. top 20 customers in total booking

SELECT
    Customer_ID,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN Booking_Status = 'Success'
        THEN 1 ELSE 0 END) AS successful_rides,
    SUM(CASE WHEN Booking_Status IN (
        'Canceled by Customer', 'Canceled by Driver'
    ) THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(SUM(CASE WHEN Booking_Status = 'Success'
        THEN Booking_Value ELSE 0 END), 2) AS total_revenue_generated
FROM bookings_clean
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY total_bookings DESC
LIMIT 20;
 -- 32. Which customers have the highest successful booking rate?
SELECT
    Customer_ID,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN Booking_Status = 'Success'
        THEN 1 ELSE 0 END) AS successful_rides,
    ROUND(
        100.0 * SUM(CASE WHEN Booking_Status = 'Success'
            THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS success_rate_pct
FROM bookings_clean
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
HAVING COUNT(*) >= 1
ORDER BY success_rate_pct DESC, total_bookings DESC
LIMIT 20;
-- 33.How frequently do customers book rides?
WITH customer_activity AS (
    SELECT
        Customer_ID,
        COUNT(*) AS total_bookings
    FROM bookings_clean
    WHERE Customer_ID IS NOT NULL
    GROUP BY Customer_ID
)
SELECT
    CASE
        WHEN total_bookings = 1 THEN 'One-time Customer'
        WHEN total_bookings BETWEEN 2 AND 4 THEN 'Occasional Customer'
        WHEN total_bookings BETWEEN 5 AND 9 THEN 'Regular Customer'
        ELSE 'Frequent Customer'
    END AS customer_segment,
    COUNT(*) AS total_customers,
    SUM(total_bookings) AS total_bookings,
    ROUND(AVG(total_bookings), 2) AS avg_bookings_per_customer
FROM customer_activity
GROUP BY customer_segment
ORDER BY total_bookings DESC;



-- 34. summary
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Booking_ID) AS unique_booking_ids,
    COUNT(DISTINCT Customer_ID) AS unique_customers,
    SUM(Booking_ID IS NULL OR TRIM(Booking_ID) = '')
        AS missing_booking_ids,
    SUM(Customer_ID IS NULL OR TRIM(Customer_ID) = '')
        AS missing_customer_ids,
    SUM(Booking_Status IS NULL OR TRIM(Booking_Status) = '')
        AS missing_statuses,
    SUM(Booking_Value < 0) AS negative_booking_values,
    SUM(Ride_Distance < 0) AS negative_ride_distances
FROM bookings_clean;



SELECT
    booking_frequency,
    COUNT(*) AS number_of_customers
FROM (
    SELECT
        Customer_ID,
        COUNT(*) AS booking_frequency
    FROM bookings_clean
    WHERE Customer_ID IS NOT NULL
    GROUP BY Customer_ID
) AS customer_summary
GROUP BY booking_frequency
ORDER BY booking_frequency;
