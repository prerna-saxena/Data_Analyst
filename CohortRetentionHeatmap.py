import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load your customer_orders.csv
orders_df = pd.read_csv("customer_orders.csv")
orders_df['order_date'] = pd.to_datetime(orders_df['order_date'])

# Step 1: Assign cohort based on first order
orders_df['order_month'] = orders_df['order_date'].dt.to_period('M')
cohort_map = orders_df.groupby('customer_id')['order_date'].min().dt.to_period('M')
orders_df['cohort_month'] = orders_df['customer_id'].map(cohort_map)

# Step 2: Calculate cohort index (months since first order)
orders_df['cohort_index'] = (
    (orders_df['order_month'].dt.year - orders_df['cohort_month'].dt.year) * 12 +
    (orders_df['order_month'].dt.month - orders_df['cohort_month'].dt.month)
)

# Step 3: Pivot to create cohort retention table
cohort_data = orders_df.groupby(['cohort_month', 'cohort_index'])['customer_id'].nunique().reset_index()
cohort_pivot = cohort_data.pivot(index='cohort_month', columns='cohort_index', values='customer_id')

# Step 4: Convert to retention %
cohort_sizes = cohort_pivot.iloc[:, 0]
retention = cohort_pivot.divide(cohort_sizes, axis=0) * 100

# Step 5: Plot heatmap
plt.figure(figsize=(14, 8))
sns.heatmap(retention, annot=True, fmt=".1f", cmap="YlGnBu", linewidths=0.5)
plt.title("Customer Retention by Cohort (in %)", fontsize=16)
plt.ylabel("Cohort Month")
plt.xlabel("Months Since First Purchase")
plt.tight_layout()
plt.savefig("customer_retention_heatmap.png")
plt.show()
