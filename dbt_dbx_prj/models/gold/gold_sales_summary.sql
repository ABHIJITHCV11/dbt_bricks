-- Gold: Explicit select from silver_sales_summary
select
	date_sk,
	date,
	store_sk,
	store_name,
	product_sk,
	product_name,
	total_quantity,
	total_net_amount
from {{ ref('silver_sales_summary') }}