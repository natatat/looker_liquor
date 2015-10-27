- view: liquor_fact

  derived_table: 
    sql: |
      select
        liquor_type_map.liquor_type,
        FIRST_VALUE(iowa.description) OVER (partition by (liquor_type_map.liquor_type) order by description_facts.count_of desc) top_brand
      from
        [fh-bigquery:liquor.iowa] iowa
      
       left join ${liquor_description_facts.SQL_TABLE_NAME} description_facts
       on iowa.description = description_facts.description
  
       left join ${liquor_type_map.SQL_TABLE_NAME} liquor_type_map
       on iowa.description = liquor_type_map.description
      
       group by
               1, description_facts.count_of, iowa.description
               
      limit 100
      
  fields: 
  - dimension: liquor_type
    type: string
    sql: ${TABLE}.liquor_type
    
  - dimension: top_brand
    type: string
    sql: ${TABLE}.top_brand
           
  
  