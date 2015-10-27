- view: events
  sql_table_name: sentry.events
  fields:

  - dimension: extra
    sql: ${TABLE}.extra

  - dimension: modules
    sql: ${TABLE}.modules

  - dimension: sentry_interfaces_exception
    sql: ${TABLE}.sentry_interfaces_Exception

  - dimension: sentry_interfaces_http
    sql: ${TABLE}.sentry_interfaces_Http

  - dimension: tags
    sql: ${TABLE}.tags

  - dimension_group: timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.timestamp

  - dimension: version
    type: int
    sql: ${TABLE}.version

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

