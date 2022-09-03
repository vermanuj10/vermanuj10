
with custOrders as (
        select
          
        user_id as custId,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(ID) as number_of_orders
        
    from {{ref('RAW_ORDERS')}} group by 1
),

final as (

    select
        {{ref('RAW_CUSTOMERS')}}.id as customer_id,
        {{ref('RAW_CUSTOMERS')}}.first_name,
        {{ref('RAW_CUSTOMERS')}}.last_name,
        co.first_order_date,
        co.most_recent_order_date,
        coalesce(co.number_of_orders, 0) as number_of_orders

    from {{ref('RAW_CUSTOMERS')}}, custOrders co where customer_id = co.custId

    --left join custOrders using (custId)

)

select * from final



