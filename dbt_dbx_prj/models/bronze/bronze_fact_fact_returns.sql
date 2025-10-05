{{ config(materialized='table') }}

SELECT
	sales_id,
	date_sk,
	store_sk,
	product_sk,
	returned_qty,
	return_reason,
	refund_amount
FROM {{ source('raw_data_dbx', 'fact_returns') }}
WHERE
	coalesce(trim(sales_id), '') != '' OR
	coalesce(trim(date_sk), '') != '' OR
	coalesce(trim(store_sk), '') != '' OR
	coalesce(trim(product_sk), '') != '' OR
	coalesce(trim(returned_qty), '') != '' OR
	coalesce(trim(return_reason), '') != '' OR
	coalesce(trim(refund_amount), '') != ''