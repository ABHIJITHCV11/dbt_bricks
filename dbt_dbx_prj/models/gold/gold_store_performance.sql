-- Gold: Explicit select from silver_store_performance
select
	store_sk,
	store_name,
	total_store_revenue,
	total_store_quantity
from {{ ref('silver_store_performance') }}