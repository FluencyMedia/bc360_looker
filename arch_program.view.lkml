view: arch_program {
  sql_table_name: bc_arch_main.arch_program ;;

  dimension: agency {
    type: string
    sql: ${TABLE}.agency ;;
  }

  dimension: campaign_group {
    type: string
    sql: ${TABLE}.campaign_group ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_location {
    type: string
    sql: ${TABLE}.campaign_location ;;
  }

  dimension: campaign_matchtype {
    type: string
    sql: ${TABLE}.campaign_matchtype ;;
  }

  dimension: campaign_region {
    type: string
    sql: ${TABLE}.campaign_region ;;
  }

  dimension: campaign_tier {
    type: string
    sql: ${TABLE}.campaign_tier ;;
  }

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

  dimension: program {
    type: string
    sql: ${TABLE}.program ;;
  }

  dimension: service_detail {
    type: string
    sql: ${TABLE}.service_detail ;;
  }

  dimension: service_line {
    type: string
    sql: ${TABLE}.service_line ;;
  }

  dimension: service_line_code {
    type: string
    sql: ${TABLE}.service_line_code ;;
  }

  dimension: service_offering {
    type: string
    sql: ${TABLE}.service_offering ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
