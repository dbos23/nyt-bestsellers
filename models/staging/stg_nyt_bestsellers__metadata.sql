with raw_metadata as (
    select *
    from {{ source('nyt_bestsellers', 'nyt_bestsellers_metadata') }}
)

select
    api_call_timestamp,
    to_date(results_bestsellers_date) as results_bestsellers_date,
    results_display_name
from raw_metadata