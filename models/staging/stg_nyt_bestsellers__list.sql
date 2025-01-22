with raw_list as (
    select *
    from {{ source('nyt_bestsellers', 'nyt_bestsellers_list') }}
)

select
    to_date(results_bestsellers_date) as results_bestsellers_date,
    title,
    author,
    rank::numeric as current_rank,
    case
            when rank_last_week::numeric = 0 then null
            else rank_last_week::numeric
        end as rank_last_week,
    weeks_on_list::numeric as weeks_on_list,
    publisher,
    primary_isbn10 as primary_isbn,
    description,
    book_image,
    book_uri
from raw_list