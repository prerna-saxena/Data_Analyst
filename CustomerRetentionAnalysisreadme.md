import pandas as pd

# Reload and prepare data
orders_df = pd.read_csv("/mnt/data/customer_orders (1).csv")
orders_df['order_date'] = pd.to_datetime(orders_df['order_date'])

# Assign cohort month (first order month for each customer)
orders_df['order_month'] = orders_df['order_date'].dt.to_period('M')
cohort_map = orders_df.groupby('customer_id')['order_date'].min().dt.to_period('M')
orders_df['cohort_month'] = orders_df['customer_id'].map(cohort_map)

# Calculate cohort index (months since first purchase)
orders_df['cohort_index'] = (
    (orders_df['order_month'].dt.year - orders_df['cohort_month'].dt.year) * 12 +
    (orders_df['order_month'].dt.month - orders_df['cohort_month'].dt.month)
)

# Pivot table: cohort_month vs cohort_index (number of customers ordering)
cohort_data = orders_df.groupby(['cohort_month', 'cohort_index'])['customer_id'].nunique().reset_index()
cohort_pivot = cohort_data.pivot(index='cohort_month', columns='cohort_index', values='customer_id')

cohort_pivot.fillna(0).astype(int).head()


you can visualize customer retention using a cohort analysis approach in tools like Power BI, Tableau, or Python (Seaborn/Matplotlib):
