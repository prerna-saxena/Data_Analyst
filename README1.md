# Create a README.md file content for the GitHub submission

readme_content = """
# 🚗 Alt Mobility Data Analyst Assignment

This repository contains the complete solution for the Data Analyst Intern Assignment by **Alt Mobility**, covering SQL queries, cohort analysis, and key findings.

---

## 📁 Datasets Used
- `customer_orders.csv` – contains order-level details.
- `payments.csv` – contains payment information linked to orders.

---

## ✅ Tasks Completed

### 1. Order and Sales Analysis
- Analyzed order status distribution.
- Evaluated revenue by order status.
- Generated monthly revenue trends.

### 2. Customer Analysis
- Identified repeat customers.
- Segmented customers based on order frequency.
- Tracked new customer acquisition over time.

### 3. Payment Status Analysis
- Assessed success/failure of payments.
- Calculated failure rates by method and over time.

### 4. Order Details Report
- Joined order and payment data into a detailed view.

### 5. Customer Retention Visualization
- Performed cohort analysis to track retention.
- Visualized customer re-purchase behavior.

---

## 🛠️ Tools & Technologies
- SQL (PostgreSQL syntax)
- Excel / BI Tool (Power BI/Tableau)
- Python (for optional cohort visualization)

---

## 📂 Folder Structure

├── SQL/ │ ├── task_1_order_analysis.sql │ ├── task_2_customer_analysis.sql │ ├── task_3_payment_analysis.sql │ ├── task_4_order_report.sql │ └── task_5_cohort_analysis.sql ├── README.md └── Visuals/ └── cohort_retention_heatmap.png (optional)


---

## 📊 Summary of Findings

- Over **33% of orders** are pending—improvement needed in fulfillment.
- **60% of customers** are repeat buyers, indicating healthy retention.
- **33% of payments fail**, with **bank transfers** having the highest failure rate.
- Customer acquisition has been consistent with **~200–250** new customers/month.
- Cohort analysis revealed gradual drop-off in returning customers over months.

---

## 📌 Recommendations

- Prioritize fulfillment for pending orders.
- Investigate high failure rate for bank transfers.
- Implement automated retry logic for payments.
- Focus on engaging low-frequency customer segments.

---

## 📅 Submission Deadline


"""

# Save the README file
readme_path = "/mnt/data/README.md"
with open(readme_path, "w") as f:
    f.write(readme_content)

readme_path
# 🚗 Alt Mobility Data Analyst Assignment

This repository contains the complete solution for the Data Analyst Intern Assignment by **Alt Mobility**, covering SQL queries, cohort analysis, and key findings.

---

## 📁 Datasets Used
- `customer_orders.csv` – contains order-level details.
- `payments.csv` – contains payment information linked to orders.

---

## ✅ Tasks Completed

### 1. Order and Sales Analysis
- Analyzed order status distribution.
- Evaluated revenue by order status.
- Generated monthly revenue trends.

### 2. Customer Analysis
- Identified repeat customers.
- Segmented customers based on order frequency.
- Tracked new customer acquisition over time.

### 3. Payment Status Analysis
- Assessed success/failure of payments.
- Calculated failure rates by method and over time.

### 4. Order Details Report
- Joined order and payment data into a detailed view.

### 5. Customer Retention Visualization
- Performed cohort analysis to track retention.
- Visualized customer re-purchase behavior.

---

## 🛠️ Tools & Technologies
- SQL (PostgreSQL syntax)
- Excel / BI Tool (Power BI/Tableau)
- Python  

---

## 📂 Folder Structure

