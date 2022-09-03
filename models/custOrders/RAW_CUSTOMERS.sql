{{ config(materialized='table') }}

with customers as (
    select
        ID as custid,
        first_name,
        last_name
    from DBT_AVERMA.RAW_CUSTOMERS
    )

select * from customers 
limit 500
