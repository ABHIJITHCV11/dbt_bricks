-- Silver: Product performance metrics
with sales as (
    select * from {{ ref('bronze_fact_sales') }}
),
product as (
    select * from {{ ref('bronze_fact_dim_product') }}
)
select
    p.product_sk,
    p.product_name,
    round(sum(s.quantity), 2) as total_quantity_sold,
    round(sum(s.net_amount), 2) as total_revenue,
    max(s.date_sk) as last_purchase_date
from product p
left join sales s on p.product_sk = s.product_sk
group by p.product_sk, p.product_name
