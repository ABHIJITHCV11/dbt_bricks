{{ config(materialized='table') }}

SELECT
	product_sk,
	product_code,
	product_name,
	department,
	category,
	supplier_sk,
	list_price,
	uom
FROM {{ source('raw_data_dbx', 'dim_product') }}
WHERE
	coalesce(trim(product_sk), '') != '' OR
	coalesce(trim(product_code), '') != '' OR
	coalesce(trim(product_name), '') != '' OR
	coalesce(trim(department), '') != '' OR
	coalesce(trim(category), '') != '' OR
	coalesce(trim(supplier_sk), '') != '' OR
	coalesce(trim(list_price), '') != '' OR
	coalesce(trim(uom), '') != ''