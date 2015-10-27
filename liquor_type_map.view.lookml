- view: liquor_type_map
  derived_table:
    sql: |
      SELECT 
        iowa.description AS description,
        CASE WHEN (REGEXP_MATCH(iowa.category_name, "RUM"))
          THEN "RUM"
        WHEN (REGEXP_MATCH(iowa.category_name, "VODKA"))
          THEN "VODKA"
        WHEN (REGEXP_MATCH(iowa.category_name, "TEQUILA"))
          THEN "TEQUILA"
        WHEN (REGEXP_MATCH(iowa.category_name, "SCHNAPPS"))
          THEN "SCHNAPPS"
        WHEN (REGEXP_MATCH(iowa.category_name, "BOURBON"))
          THEN "BOURBON"
        WHEN (REGEXP_MATCH(iowa.category_name, "WHISKEY"))
          THEN "WHISKEY"
        WHEN (REGEXP_MATCH(iowa.category_name, "WHISKIE"))
          THEN "WHISKEY"
        WHEN (REGEXP_MATCH(iowa.category_name, "SCOTCH"))
          THEN "SCOTCH"
        WHEN (REGEXP_MATCH(iowa.category_name, "TRIPLE SEC"))
          THEN "TRIPLE SEC"
        WHEN (REGEXP_MATCH(iowa.category_name, "BRANDIES"))
          THEN "BRANDIES"
        WHEN (REGEXP_MATCH(iowa.category_name, "GIN"))
          THEN "GIN"
        WHEN (REGEXP_MATCH(iowa.category_name, "LIQUEUR"))
          THEN "LIQUEUR"
        WHEN (REGEXP_MATCH(iowa.category_name, "AMARETTO"))
          THEN "LIQUEUR"
        WHEN (REGEXP_MATCH(iowa.category_name, "COCKTAILS"))
          THEN "PRE-MIXED COCKTAILS"
        WHEN (REGEXP_MATCH(iowa.description, "Moon"))
          THEN "MOONSHINE"
        WHEN (REGEXP_MATCH(iowa.description, "Tequila"))
          THEN "TEQUILA"
        WHEN (REGEXP_MATCH(iowa.description, "Vodka"))
          THEN "VODKA"
        ELSE "OTHER"
      END
      AS liquor_type 
      FROM [fh-bigquery:liquor.iowa] AS iowa

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: liquor_type
    type: string
    sql: ${TABLE}.liquor_type

  sets:
    detail:
      - description
      - liquor_type
