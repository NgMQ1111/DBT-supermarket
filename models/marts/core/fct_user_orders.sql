with order_product as (
    select * from {{ ref('stg_supermarket__order_products') }}
),
order_small as (
    select * from {{ ref('stg_supermarket__orders_small_version') }}
),
user_orders as (
    select
        os.user_id,
        op.*
    from 
        order_product op
    join
        order_small os
    on
        op.order_id = os.order_id
    order by
        os.user_id, op.add_to_cart_order
)

select * from user_orders