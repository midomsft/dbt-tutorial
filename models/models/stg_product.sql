
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

with source_data as (

    SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[Color]
      ,[StandardCost]
      ,[ListPrice]
      ,isnull([Size], 'N/A') Size
      ,isnull([Weight],0) Weight
      ,[ProductCategoryID]
      ,[ProductModelID]
      ,[SellStartDate]
      ,isnull([SellEndDate],'1-jan-2999') SellEndDate
      ,[DiscontinuedDate]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [dbo].[product]
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
