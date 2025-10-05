-- Silver: Store performance metrics
with sales as (
    select * from {{ ref('bronze_fact_sales') }}
),
store as (
    select * from {{ ref('bronze_fact_dim_store') }}
)
select
    st.store_sk,
    st.store_name,
    round(sum(s.net_amount), 2) as total_store_revenue,
    sum(s.quantity) as total_store_quantity
from store st
left join sales s on st.store_sk = s.store_sk
group by st.store_sk, st.store_name
