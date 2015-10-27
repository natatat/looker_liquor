- view: liquor_description_facts
  derived_table:
    sql: |
      SELECT description, COUNT(*) count_of 
      FROM [fh-bigquery:liquor.iowa], 
      GROUP BY 1

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: count_of
    type: int
    sql: ${TABLE}.count_of
