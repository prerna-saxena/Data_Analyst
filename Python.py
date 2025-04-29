import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load customer orders dataset again
orders_df = pd.read_csv("/mnt/data/customer_orders (1).csv")
orders_df['order_date'] = pd.to_datetime(orders_df['order_date'])

# Assign cohort (first order month)
orders_df['order_month'] = orders_df['order_date'].dt.to_period('M')
cohort_map = orders_df.groupby('customer_id')['order_date'].min().dt.to_period('M')
orders_df['cohort_month'] = orders_df['customer_id'].map(cohort_map)

# Calculate cohort index (months since first purchase)
orders_df['cohort_index'] = (
    (orders_df['order_month'].dt.year - orders_df['cohort_month'].dt.year) * 12 +
    (orders_df['order_month'].dt.month - orders_df['cohort_month'].dt.month)
)

# Cohort table
cohort_data = orders_df.groupby(['cohort_month', 'cohort_index'])['customer_id'].nunique().reset_index()
cohort_pivot = cohort_data.pivot(index='cohort_month', columns='cohort_index', values='customer_id')

# Convert to retention rate
cohort_sizes = cohort_pivot.iloc[:, 0]
retention = cohort_pivot.divide(cohort_sizes, axis=0).round(3) * 100

# Plot heatmap
plt.figure(figsize=(14, 8))
sns.heatmap(retention, annot=True, fmt=".1f", cmap="YlGnBu", linewidths=0.5)
plt.title("Customer Retention by Cohort (in %)", fontsize=16)
plt.ylabel("Cohort Month")
plt.xlabel("Months Since First Purchase")
plt.tight_layout()

# Save the plot
plot_path = "/mnt/data/customer_retention_heatmap.png"
plt.savefig(plot_path)
plt.close()

plot_path
