view: mx_master {
  sql_table_name: bc_bq_data.mx_master ;;

  dimension: adgroup_id {
    type: string
    sql: ${TABLE}.adgroup_id ;;
  }

  dimension: adnetwork_01 {
    type: string
    sql: ${TABLE}.adnetwork_01 ;;
  }

  dimension: adnetwork_02 {
    type: string
    sql: ${TABLE}.adnetwork_02 ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}.creative_id ;;
  }

  dimension: criterion_id {
    type: string
    sql: ${TABLE}.criterion_id ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: interaction_types {
    type: string
    sql: ${TABLE}.interaction_types ;;
  }

  dimension: interactions {
    type: number
    sql: ${TABLE}.interactions ;;
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

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: outcome_value {
    type: number
    sql: ${TABLE}.outcome_value ;;
  }

  dimension: outcomes_bulk {
    type: number
    sql: ${TABLE}.outcomes_bulk ;;
  }

  dimension: position_avg {
    type: number
    sql: ${TABLE}.position_avg ;;
  }

  dimension: slot {
    type: string
    sql: ${TABLE}.slot ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
