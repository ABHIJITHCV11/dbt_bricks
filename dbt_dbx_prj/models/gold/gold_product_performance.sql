-- Gold: Explicit select from silver_product_performance
select	
    product_sk,
	product_name,
	total_quantity_sold,
	total_revenue,
	last_purchase_date
from {{ ref('silver_product_performance') }}