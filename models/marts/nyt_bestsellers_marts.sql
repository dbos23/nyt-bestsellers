with stg__list as (
    select *
    from {{ ref('stg_nyt_bestsellers__list') }}
),

stg__metadata as (
    select *
    from {{ ref('stg_nyt_bestsellers__metadata') }}
),

final as (
    select
        stg__metadata.api_call_timestamp,
        stg__metadata.results_bestsellers_date,
        stg__metadata.results_display_name,
        stg__list.title,
        stg__list.author,
        stg__list.current_rank,
        stg__list.rank_last_week,
        stg__list.weeks_on_list,
        stg__list.publisher,
        stg__list.primary_isbn,
        stg__list.description,
        stg__list.book_image,
        stg__list.book_uri
    from stg__list inner join stg__metadata
        on stg__list.results_bestsellers_date = stg__metadata.results_bestsellers_date
)

select *
from final