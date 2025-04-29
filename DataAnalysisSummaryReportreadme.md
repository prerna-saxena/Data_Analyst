This analysis explores order data, customer behavior, payment patterns, and customer retention using SQL-based queries on the provided datasets: customer_orders.csv and payments.csv.

1. 📦 Order & Sales Analysis
🔹 Key Metrics
Total Orders: 15,000

Total Revenue: ₹3.81 million

Average Order Value (AOV): ₹254.18

🔹 Order Status Distribution

Status	Orders	% Share
Delivered	5,057	33.7%
Shipped	4,874	32.5%
Pending	5,069	33.8%
🔍 Insight: One-third of orders remain in pending status, tying up ~₹1.27M in revenue. Order fulfillment efficiency should be improved.

2. 👥 Customer Analysis
🔹 Customer Breakdown
Unique Customers: 7,334

Repeat Customers: 4,402 (~60%)

🔹 Segmentation by Frequency

Segment	Range	Count
One-time	1	2,932
Low	2–3	3,586
Medium	4–5	745
High	>5	71
🔍 Insight: While most customers order just once, a loyal minority (High-frequency) offers strong retention potential.

3. 💳 Payment Status Analysis
🔹 Payment Completion Breakdown

Status	Count	Share (%)
Completed	4,991	33.3%
Failed	5,003	33.4%
Pending	5,006	33.4%
Failure Rate: 33.35%

🔹 Failures by Payment Method

Method	Failure %
Bank Transfer	35.1%
Credit Card	33.3%
PayPal	31.6%
🔍 Insight: 2 out of 3 payments are either pending or failed. Bank transfers have the highest failure rate.

4. 📄 Order Details Report
A merged view of orders and payments provides detailed operational visibility:

Order ID, Date, Amount, Status

Payment Date, Method, Amount, Status

🔍 Insight: Enables full-lifecycle tracking of each order and highlights gaps (e.g., orders placed but not paid).

5. 📈 Customer Retention (Cohort Analysis)
Customers grouped by first order month (cohorts)

Tracked how many repurchased in later months

Retention drops steadily over months — common in e-commerce, but highlights the need for:

Retargeting

Loyalty campaigns

Post-purchase engagement

📌 Recommendations
Reduce Pending Orders: Streamline fulfillment processes.

Improve Payment Success Rates: Prioritize resolving issues with bank transfers.

Engage Low-Frequency Customers: Offer personalized incentives.

Leverage Loyal Customers: Build referral and reward programs.

Continue Retention Tracking: Use cohort analysis to measure marketing impact.

SQL files and visualizations ready for GitHub.

BI-compatible cohort matrix created for visualization tools.

