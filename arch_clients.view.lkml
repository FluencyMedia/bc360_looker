view: arch_clients {
  sql_table_name: bc_arch_main.arch_clients ;;

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: org_short {
    type: string
    sql: ${TABLE}.org_short ;;
  }

  dimension: organization {
    type: string
    sql: ${TABLE}.organization ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
