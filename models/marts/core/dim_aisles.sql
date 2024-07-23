with source as (
    select * from {{ ref('stg_supermarket__aisles') }}
)

select * from source