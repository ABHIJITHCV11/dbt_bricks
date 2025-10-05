{{ config(materialized='table') }}

SELECT
	customer_sk,
	customer_code,
	first_name,
	last_name,
	gender,
	email,
	phone,
	loyalty_tier,
	signup_date
FROM {{ source('raw_data_dbx', 'dim_customer') }}
WHERE
	-- coalesce(trim(customer_sk), '') != '' OR 
    -- removing rows where every thing other than surrogate key is null or empty
    -- pk test will take care of surrogate key . the test is in bronze_dim_customers.yml
	coalesce(trim(customer_code), '') != '' OR
	coalesce(trim(first_name), '') != '' OR
	coalesce(trim(last_name), '') != '' OR
	coalesce(trim(gender), '') != '' OR
	coalesce(trim(email), '') != '' OR
	coalesce(trim(phone), '') != '' OR
	coalesce(trim(loyalty_tier), '') != '' OR
	coalesce(trim(signup_date), '') != ''