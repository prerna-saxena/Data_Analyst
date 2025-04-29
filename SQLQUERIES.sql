A complete set of SQL queries for all tasks in the Alt Mobility Data Analyst Assignment. These are written assuming you’ve imported the two CSVs (customer_orders.csv, payments.csv) into SQL tables named:

  customer_orders

payments

TASK 1: Order and Sales Analysis
Goal: Analyze order fulfillment and revenue trends.

-- Order count by status
SELECT 
    order_status,
    COUNT(*) AS total_orders
FROM customer_orders
GROUP BY order_status;

-- Total revenue by order status
SELECT 
    order_status,
    SUM(order_amount) AS total_revenue
FROM customer_orders
GROUP BY order_status;

-- Monthly sales trend
SELECT 
    DATE_TRUNC('month', order_date) AS order_month,
    SUM(order_amount) AS monthly_sales
FROM customer_orders
GROUP BY order_month
ORDER BY order_month;


TASK 2: Customer Analysis
Goal: Identify repeat ordering, segment customers, trends.

-- Total and repeat customers
SELECT 
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(*) FILTER (WHERE order_count > 1) AS repeat_customers
FROM (
    SELECT customer_id, COUNT(*) AS order_count
    FROM customer_orders
    GROUP BY customer_id
) AS customer_orders_count;

-- Customer segmentation based on number of orders
SELECT 
    CASE
        WHEN order_count = 1 THEN 'One-time'
        WHEN order_count BETWEEN 2 AND 3 THEN 'Low'
        WHEN order_count BETWEEN 4 AND 5 THEN 'Medium'
        ELSE 'High'
    END AS segment,
    COUNT(*) AS customer_count
FROM (
    SELECT customer_id, COUNT(*) AS order_count
    FROM customer_orders
    GROUP BY customer_id
) AS customer_orders_count
GROUP BY segment;

-- Monthly new customer count (cohort month)
SELECT 
    DATE_TRUNC('month', MIN(order_date)) AS cohort_month,
    COUNT(DISTINCT customer_id) AS new_customers
FROM customer_orders
GROUP BY cohort_month
ORDER BY cohort_month;


-- Total and repeat customers
SELECT 
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(*) FILTER (WHERE order_count > 1) AS repeat_customers
FROM (
    SELECT customer_id, COUNT(*) AS order_count
    FROM customer_orders
    GROUP BY customer_id
) AS customer_orders_count;

-- Customer segmentation based on number of orders
SELECT 
    CASE
        WHEN order_count = 1 THEN 'One-time'
        WHEN order_count BETWEEN 2 AND 3 THEN 'Low'
        WHEN order_count BETWEEN 4 AND 5 THEN 'Medium'
        ELSE 'High'
    END AS segment,
    COUNT(*) AS customer_count
FROM (
    SELECT customer_id, COUNT(*) AS order_count
    FROM customer_orders
    GROUP BY customer_id
) AS customer_orders_count
GROUP BY segment;

-- Monthly new customer count (cohort month)
SELECT 
    DATE_TRUNC('month', MIN(order_date)) AS cohort_month,
    COUNT(DISTINCT customer_id) AS new_customers
FROM customer_orders
GROUP BY cohort_month
ORDER BY cohort_month;


Payment Status Analysis
Goal: Investigate payment success/failure patterns.

-- Payment status distribution
SELECT 
    payment_status,
    COUNT(*) AS count
FROM payments
GROUP BY payment_status;

-- Failure rate (%)
SELECT 
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE payment_status = 'failed') / COUNT(*), 2
    ) AS failure_rate_percent
FROM payments;

-- Failure rate by payment method
SELECT 
    payment_method,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS failure_share
FROM payments
WHERE payment_status = 'failed'
GROUP BY payment_method;

-- Monthly failed payments
SELECT 
    DATE_TRUNC('month', payment_date) AS payment_month,
    COUNT(*) AS failed_payments
FROM payments
WHERE payment_status = 'failed'
GROUP BY payment_month
ORDER BY payment_month;
TASK 4: Order Details Report
Goal: Comprehensive report of orders + payments.

sql
SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_amount,
    o.order_status,
    p.payment_date,
    p.payment_amount,
    p.payment_method,
    p.payment_status
FROM customer_orders o
LEFT JOIN payments p ON o.order_id = p.order_id;

TASK 5: Customer Retention Cohort Analysis
Goal: Visualize how many customers from a cohort made repeat purchases.

  -- Cohort analysis: cohort_month and months since first purchase
WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(DATE_TRUNC('month', order_date)) AS cohort_month
    FROM customer_orders
    GROUP BY customer_id
),
customer_orders_with_cohort AS (
    SELECT 
        o.customer_id,
        DATE_TRUNC('month', o.order_date) AS order_month,
        f.cohort_month,
        DATE_PART('month', AGE(DATE_TRUNC('month', o.order_date), f.cohort_month)) +
        12 * DATE_PART('year', AGE(DATE_TRUNC('month', o.order_date), f.cohort_month)) AS cohort_index
    FROM customer_orders o
    JOIN first_orders f ON o.customer_id = f.customer_id
)
SELECT 
    cohort_month,
    cohort_index,
    COUNT(DISTINCT customer_id) AS retained_customers
FROM customer_orders_with_cohort
GROUP BY cohort_month, cohort_index
ORDER BY cohort_month, cohort_index;














