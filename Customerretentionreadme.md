Steps to Track Customer Retention
1. Create Cohort Labels
For each customer, find their first order month — this becomes their cohort_month.

2. Track Repeat Activity
For each month following the first purchase, record whether the customer placed another order.

Define a column like cohort_index = months since the first order.

3. Build Cohort Table
Create a matrix with:

Rows = cohort_month

Columns = cohort_index (Month 0, Month 1, Month 2, ...)

Values = count of customers who made a repeat purchase in that month

 Example Cohort Table

Cohort Month	M0	M1	M2	M3
Jan 2023	120	40	22	15
Feb 2023	98	33	18	10
M0 = first order month

M1+ = subsequent months

 Visualization Tips
Use a heatmap to display retention intensity (darker = more customers retained).

Power BI:

Use Matrix visual

Apply conditional formatting for retention %

Tableau:

Pivot your data by cohort and cohort_index

Use color to highlight retention trends

Python:

python
 
import seaborn as sns
sns.heatmap(cohort_pivot, cmap="YlGnBu", annot=True, fmt="d")
