{{ config(materialized='table') }}
with CUSTOMERS as (
    select
        ID as custid,
        first_name,
        last_name
    from {{ source('dbt_averma','RAW_CUSTOMERS') }}
    )

select * from CUSTOMERS;