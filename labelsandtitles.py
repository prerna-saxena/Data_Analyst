import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Assuming `retention` is your cohort retention matrix (as %)

plt.figure(figsize=(14, 8))

# Create heatmap with formatted annotations
sns.heatmap(retention, 
            annot=True, fmt=".1f", cmap="YlGnBu", linewidths=0.5, 
            cbar_kws={'label': 'Retention Rate (%)'})

# Titles and labels
plt.title("📊 Customer Retention by Monthly Cohort", fontsize=18, pad=20)
plt.xlabel("Months Since First Purchase", fontsize=12)
plt.ylabel("Cohort Month (First Purchase)", fontsize=12)

# Improve tick label formatting
plt.xticks(rotation=0)
plt.yticks(rotation=0)

# Layout adjustment
plt.tight_layout()

# Save or show
plt.savefig("customer_retention_heatmap.png")
plt.show()

What Each Label Means:
Title: Describes the plot purpose: retention trends by cohort

X-axis: "Months Since First Purchase" = how many months after the first order

Y-axis: "Cohort Month" = the month in which the customer placed their first order

Color Bar: Labeled as "Retention Rate (%)" for clarity

Annotations: Shows exact retention % in each cell (like 52.3%)
