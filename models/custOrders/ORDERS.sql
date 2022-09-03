{{ config(materialized='table') }}

with ord as (

    select
        
        cust_id,
        order_id,
        order_date,
        status

    from {{ source('dbt_averma','RAW_ORDERS') }}

)

select * from ord