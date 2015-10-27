- view: iowa
  sql_table_name: |
    [fh-bigquery:liquor.iowa]

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension_group: purchased
    type: time
    timeframes: [time, date, week, day_of_week, month]
    sql: |
      CAST (${TABLE}.date as timestamp)
      
  - dimension: seasons_created
    type: string 
    sql: | 
      CASE 
        WHEN DAYOFYEAR(CAST(${TABLE}.date as timestamp)) > 356 
          THEN 'WINTER'
        WHEN DAYOFYEAR(CAST(${TABLE}.date as timestamp)) < 79 
          THEN 'WINTER'
        WHEN DAYOFYEAR(CAST(${TABLE}.date as timestamp)) BETWEEN 80 AND 170
          THEN 'SPRING'
        WHEN DAYOFYEAR(CAST(${TABLE}.date as timestamp)) BETWEEN 170 AND 265
          THEN 'SUMMER'
        WHEN DAYOFYEAR(CAST(${TABLE}.date as timestamp)) BETWEEN 265 AND 356
          THEN 'FALL'
        ELSE 'NO'
      END
      
  - dimension_group: convenience_store
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.convenience_store

  - dimension: store
    type: string
    sql: ${TABLE}.store

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: zipcode
    type: string
    sql: ${TABLE}.zipcode

  - dimension: store_location
    type: string
    sql: ${TABLE}.store_location

  - dimension: county_number
    type: string
    sql: ${TABLE}.county_number

  - dimension: county
    type: string
    sql: ${TABLE}.county

  - dimension: category
    type: string
    sql: ${TABLE}.category
    
  - dimension: category_name
    type: string
    sql: ${TABLE}.category_name

  - dimension: category_type
    type: string
    sql: |
      CASE WHEN (REGEXP_MATCH(${TABLE}.category_name, "RUM"))
          THEN "RUM"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "VODKA"))
          THEN "VODKA"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "TEQUILA"))
          THEN "TEQUILA"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "SCHNAPPS"))
          THEN "SCHNAPPS"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "BOURBON"))
          THEN "BOURBON"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "WHISKEY"))
          THEN "WHISKEY"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "WHISKIE"))
          THEN "WHISKEY"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "SCOTCH"))
          THEN "SCOTCH"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "TRIPLE SEC"))
          THEN "TRIPLE SEC"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "BRANDIES"))
          THEN "BRANDIES"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "GIN"))
          THEN "GIN"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "LIQUEUR"))
          THEN "LIQUEUR"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "AMARETTO"))
          THEN "LIQUEUR"
        WHEN (REGEXP_MATCH(${TABLE}.category_name, "COCKTAILS"))
          THEN "PRE-MIXED COCKTAILS"
        WHEN (REGEXP_MATCH(${TABLE}.description, "Moon"))
          THEN "MOONSHINE"
        WHEN (REGEXP_MATCH(${TABLE}.description, "Tequila"))
          THEN "TEQUILA"
        WHEN (REGEXP_MATCH(${TABLE}.description, "Vodka"))
          THEN "VODKA"
        ELSE "OTHER"
      END

  - dimension: vendor_no
    type: string
    sql: ${TABLE}.vendor_no

  - dimension: vendor
    type: string
    sql: ${TABLE}.vendor

  - dimension: item
    type: string
    sql: ${TABLE}.item

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: pack
    type: int
    sql: ${TABLE}.pack

  - dimension: liter_size
    type: int
    sql: ${TABLE}.liter_size

  - dimension: state_btl_cost
    type: number
    sql: ${TABLE}.state_btl_cost

  - dimension: btl_price
    type: number
    sql: ${TABLE}.btl_price

  - dimension: bottle_qty
    type: int
    sql: ${TABLE}.bottle_qty

  - dimension: total
    type: number
    sql: ${TABLE}.total

  sets:
    detail:
      - date
      - convenience_store_time
      - store
      - name
      - address
      - city
      - zipcode
      - store_location
      - county_number
      - county
      - category
      - category_name
      - vendor_no
      - vendor
      - item
      - description
      - pack
      - liter_size
      - state_btl_cost
      - btl_price
      - bottle_qty
      - total

