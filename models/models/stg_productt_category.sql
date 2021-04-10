
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

with source_data as (

SELECT pc.[ProductCategoryID] ParentProductCategoryId
	   ,pcp.ProductCategoryID
      ,pc.[Name] ParentCategory
	  ,pcp.Name Category
      ,pc.[rowguid]
      ,pc.[ModifiedDate]
  FROM [ProductCategory] pc
  inner join [ProductCategory] pcp on pc.productcategoryid = pcp.parentproductcategoryid
  
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
