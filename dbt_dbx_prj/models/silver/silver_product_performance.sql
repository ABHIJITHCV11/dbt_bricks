-- Silver: Product performance metrics
with sales as (
    select * from {{ ref('bronze_fact_sales') }}
),
product as (
    select * from {{ ref('bronze_fact_dim_product') }}
),
date_dim as (
    select * from {{ ref('bronze_dim_date') }}
)
select
    p.product_sk,
    p.product_name,
    round(sum(s.quantity), 2) as total_quantity_sold,
    round(sum(s.net_amount), 2) as total_revenue,
    max(d.date) as last_purchase_date
from product p
left join sales s on p.product_sk = s.product_sk
left join date_dim d on s.date_sk = d.date_sk
group by p.product_sk, p.product_name