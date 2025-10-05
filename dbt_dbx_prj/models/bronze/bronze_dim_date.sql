{{ config(materialized='table') }}

SELECT
	date_sk,
	date,
	day,
	month,
	month_name,
	quarter,
	year,
	day_of_week,
	day_name,
	is_weekend,
	is_month_end,
	is_month_start,
	is_quarter_end,
	is_quarter_start
FROM {{ source('raw_data_dbx', 'dim_date') }}
WHERE
	coalesce(trim(date_sk), '') != '' OR
	coalesce(trim(date), '') != '' OR
	coalesce(trim(day), '') != '' OR
	coalesce(trim(month), '') != '' OR
	coalesce(trim(month_name), '') != '' OR
	coalesce(trim(quarter), '') != '' OR
	coalesce(trim(year), '') != '' OR
	coalesce(trim(day_of_week), '') != '' OR
	coalesce(trim(day_name), '') != '' OR
	coalesce(trim(is_weekend), '') != '' OR
	coalesce(trim(is_month_end), '') != '' OR
	coalesce(trim(is_month_start), '') != '' OR
	coalesce(trim(is_quarter_end), '') != '' OR
	coalesce(trim(is_quarter_start), '') != ''