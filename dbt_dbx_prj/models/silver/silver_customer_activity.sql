-- Silver: Customer activity metrics
with sales as (
    select * from {{ ref('bronze_fact_sales') }}
),
customer as (
    select * from {{ ref('bronze_dim_customer') }}
)
select
    c.customer_sk,
    c.first_name,
    c.last_name,
    count(s.sales_id) as total_purchases,
    round(sum(s.net_amount), 2) as total_spent,
    max(s.date_sk) as last_purchase_date
from customer c
left join sales s on c.customer_sk = s.customer_sk
group by c.customer_sk, c.first_name, c.last_name
