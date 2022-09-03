{{ config(materialized='table') }}
with CUST as (
    select
        ID as custid,
        first_name,
        last_name
    from {{ source('dbt_averma','RAW_CUSTOMERS') }}
    )

select * from CUST;