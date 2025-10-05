{{ config(materialized='table') }}

SELECT
	store_sk,
	store_code,
	store_name,
	city,
	state_province,
	region,
	country,
	open_date,
	sq_ft
FROM {{ source('raw_data_dbx', 'dim_store') }}
WHERE
	coalesce(trim(store_sk), '') != '' OR
	coalesce(trim(store_code), '') != '' OR
	coalesce(trim(store_name), '') != '' OR
	coalesce(trim(city), '') != '' OR
	coalesce(trim(state_province), '') != '' OR
	coalesce(trim(region), '') != '' OR
	coalesce(trim(country), '') != '' OR
	coalesce(trim(open_date), '') != '' OR
	coalesce(trim(sq_ft), '') != ''