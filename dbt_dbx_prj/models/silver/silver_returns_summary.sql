-- Silver: Returns summary by product and store
with returns as (
    select * from {{ ref('bronze_fact_returns') }}
),
product as (
    select * from {{ ref('bronze_fact_dim_product') }}
),
store as (
    select * from {{ ref('bronze_fact_dim_store') }}
)
select
    r.product_sk,
    p.product_name,
    r.store_sk,
    st.store_name,
    round(sum(r.returned_qty), 2) as total_returned_qty,
    round(sum(r.refund_amount), 2) as total_refund_amount
from returns r
left join product p on r.product_sk = p.product_sk
left join store st on r.store_sk = st.store_sk
group by r.product_sk, p.product_name, r.store_sk, st.store_name