-- Gold: Explicit select from silver_customer_activity
select	
    customer_sk,
	first_name,
	last_name,
	total_purchases,
	total_spent,
	last_purchase_date
from {{ ref('silver_customer_activity') }}