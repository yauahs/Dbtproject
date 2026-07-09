{{ config(
    materialized='view',
    tags=['combined']
) }}

with first_model as (
    select * from {{ ref('my_first_dbt_model') }}
),

second_model as (
    select * from {{ ref('my_second_dbt_model') }}
),

third_model as (
    select * from {{ ref('newmodel') }}
)

select
    'my_first_dbt_model' as origin_model,
    id
from first_model

union all

select
    'my_second_dbt_model' as origin_model,
    id
from second_model

union all

select
    'newmodel' as origin_model,
    id
from third_model
