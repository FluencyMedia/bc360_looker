view: arch_outcomes {
  sql_table_name: bc_arch_main.arch_outcomes ;;

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

  dimension: outcome_intent {
    type: string
    sql: ${TABLE}.outcome_intent ;;
  }

  dimension: outcome_mechanism {
    type: string
    sql: ${TABLE}.outcome_mechanism ;;
  }

  dimension: outcome_quality {
    type: string
    sql: ${TABLE}.outcome_quality ;;
  }

  dimension: outcome_score {
    type: string
    sql: ${TABLE}.outcome_score ;;
  }

  dimension: outcome_tracker_id {
    type: string
    sql: ${TABLE}.outcome_tracker_id ;;
  }

  dimension: outcome_type {
    type: string
    sql: ${TABLE}.outcome_type ;;
  }

  dimension: outcome_type_name {
    type: string
    sql: ${TABLE}.outcome_type_name ;;
  }

  measure: count {
    type: count
    drill_fields: [outcome_type_name]
  }
}
