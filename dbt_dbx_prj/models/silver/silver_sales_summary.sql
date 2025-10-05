-- Silver: Sales summary by product, store, and date
with sales as (
    select * from {{ ref('bronze_fact_sales') }}
),
product as (
    select * from {{ ref('bronze_fact_dim_product') }}
),
store as (
    select * from {{ ref('bronze_fact_dim_store') }}
),
date as (
    select * from {{ ref('bronze_dim_date') }}
)
select
    s.date_sk,
    d.date,
    s.store_sk,
    st.store_name,
    s.product_sk,
    p.product_name,
    round(sum(s.quantity), 2) as total_quantity,
    round(sum(s.net_amount), 2) as total_net_amount
from sales s
left join product p on s.product_sk = p.product_sk
left join store st on s.store_sk = st.store_sk
left join date d on s.date_sk = d.date_sk
group by s.date_sk, d.date, s.store_sk, st.store_name, s.product_sk, p.product_name