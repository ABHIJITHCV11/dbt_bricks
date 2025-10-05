{{ config(materialized='table') }}

SELECT
	sales_id,
	date_sk,
	store_sk,
	product_sk,
	customer_sk,
	promotion_sk,
	quantity,
	unit_price,
	gross_amount,
	discount_amount,
	net_amount,
	payment_method
FROM {{ source('raw_data_dbx', 'fact_sales') }}
WHERE
	coalesce(trim(sales_id), '') != '' OR
	coalesce(trim(date_sk), '') != '' OR
	coalesce(trim(store_sk), '') != '' OR
	coalesce(trim(product_sk), '') != '' OR
	coalesce(trim(customer_sk), '') != '' OR
	coalesce(trim(promotion_sk), '') != '' OR
	coalesce(trim(quantity), '') != '' OR
	coalesce(trim(unit_price), '') != '' OR
	coalesce(trim(gross_amount), '') != '' OR
	coalesce(trim(discount_amount), '') != '' OR
	coalesce(trim(net_amount), '') != '' OR
	coalesce(trim(payment_method), '') != ''