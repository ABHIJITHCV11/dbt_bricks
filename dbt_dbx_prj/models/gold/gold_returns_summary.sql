-- Gold: Explicit select from silver_returns_summary
select
	product_sk,
	product_name,
	store_sk,
	store_name,
	total_returned_qty,
	total_refund_amount
from {{ ref('silver_returns_summary') }}