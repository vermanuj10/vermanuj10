{{ config(materialized='table') }}

with orders as (

    select
        d as order_id,
        user_id as customer_id,
        order_date,
        status

    from DBT_AVERMA.RAW_ORDERS

)

select * from orders