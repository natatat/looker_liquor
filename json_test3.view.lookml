- view: json_test3
  sql_table_name: sentry.json_test3
  fields:

  - dimension: extra
    sql: ${TABLE}.extra

  - dimension: modules
    sql: ${TABLE}.modules

  - dimension: sentry_interfaces_exception
    sql: ${TABLE}.sentry_interfaces_Exception

  - dimension: tags
    sql: ${TABLE}.tags

  - dimension: version
    type: int
    sql: ${TABLE}.version

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

