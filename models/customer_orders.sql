
with custOrders as (
        select
          
        user_id as custId,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(D) as number_of_orders
        
    from {{ref('raw_orders')}} group by 1
),

final as (

    select
        {{ref('raw_customers')}}.id as customer_id,
        {{ref('raw_customers')}}.first_name,
        {{ref('raw_customers')}}.last_name,
        co.first_order_date,
        co.most_recent_order_date,
        coalesce(co.number_of_orders, 0) as number_of_orders

    from {{ref('raw_customers')}}, custOrders co where customer_id = co.custId

    --left join custOrders using (custId)

)

select * from final



