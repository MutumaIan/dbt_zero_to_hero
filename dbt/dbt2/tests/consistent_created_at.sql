with fct_reviews as (
    select * from {{ ref('fct_reviews') }}
), 
dim_listings_cleansed as (
    select * from {{ ref('dim_listings_cleansed') }}
)
select rf.*, dlc.created_at, dlc.listing_id from fct_reviews rf left join dim_listings_cleansed dlc
on rf.listing_id = dlc.listing_id
where dlc.created_at > rf.review_date