-- Silver: Customer activity metrics
with sales as (
    select * from {{ ref('bronze_fact_sales') }}
),
customer as (
    select * from {{ ref('bronze_dim_customer') }}
),
date_dim as (
    select * from {{ ref('bronze_dim_date') }}
)
select
    c.customer_sk,
    c.first_name,
    c.last_name,
    count(s.sales_id) as total_purchases,
    round(sum(s.net_amount), 2) as total_spent,
    max(d.date) as last_purchase_date
from customer c
left join sales s on c.customer_sk = s.customer_sk
left join date_dim d on s.date_sk = d.date_sk
group by c.customer_sk, c.first_name, c.last_name