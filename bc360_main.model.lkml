label: "BC360 - All Clients"

connection: "bc360_bq_data"
include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

datagroup: dg_bc360_bq {
  sql_trigger:  SELECT
                  MAX(trg.trigger_stamp)
                FROM (SELECT
                        trigger_stamp
                      FROM bc360_admin_data.bc360_admin_trigger_lastupdate) trg ;;
  max_cache_age: "24 hours"
}

persist_with: dg_bc360_bq

explore: bc360_marketing_master_day {
  from: arch_clients
  label: "BC360 - Master [Daily]"

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${bc360_marketing_master_day.organization_id} = ${arch_program.organization_id} ;;
  }

  join: mx_marketing_master_day {
    relationship: one_to_many
    type: left_outer
    sql_on: ${arch_program.adgroup_id} = ${mx_marketing_master_day.adgroup_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_many
    type: left_outer
    sql_on: ${mx_marketing_master_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }
}

explore: bc360_marketing_master_month {
  from: arch_clients
  label: "BC360 - Master [Monthly]"

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${bc360_marketing_master_month.organization_id} = ${arch_program.organization_id} ;;
  }

  join: mx_marketing_master_day {
    relationship: one_to_many
    type: left_outer
    sql_on: ${arch_program.adgroup_id} = ${mx_marketing_master_day.adgroup_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_many
    type: left_outer
    sql_on: ${mx_marketing_master_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }
}

explore: bc360_marketing_core_day {
  from: arch_clients
  label: "BC360 - Core [Daily]"

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${bc360_marketing_core_day.organization_id} = ${arch_program.organization_id} ;;
  }

  join: mx_marketing_master_day {
    relationship: one_to_many
    type: left_outer
    sql_on: ${arch_program.adgroup_id} = ${mx_marketing_master_day.adgroup_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_many
    type: left_outer
    sql_on: ${mx_marketing_master_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }
}

explore: bc360_marketing_core_month {
  from: arch_clients
  label: "BC360 - Core [Monthly]"

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${bc360_marketing_core_month.organization_id} = ${arch_program.organization_id} ;;
  }

  join: mx_marketing_master_day {
    relationship: one_to_many
    type: left_outer
    sql_on: ${arch_program.adgroup_id} = ${mx_marketing_master_day.adgroup_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_many
    type: left_outer
    sql_on: ${mx_marketing_master_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }
}

explore: bh_mx_marketing_master_day {
  from: arch_clients
  label: "BC360 - Master [Daily]"

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${bh_mx_marketing_master_day.organization_id} = ${arch_program.organization_id} ;;
  }

  join: bh_marketing_master_day {
    relationship: one_to_many
    type: left_outer
    sql_on: ${arch_program.adgroup_id} = ${bh_marketing_master_day.adgroup_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_many
    type: left_outer
    sql_on: ${bh_marketing_master_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }
}

explore: scl_mx_marketing_master_day {
  from: arch_clients
  label: "BC360 - Master [Daily]"

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${scl_mx_marketing_master_day.organization_id} = ${arch_program.organization_id} ;;
  }

  join: scl_marketing_master_day {
    relationship: one_to_many
    type: left_outer
    sql_on: ${arch_program.adgroup_id} = ${scl_marketing_master_day.adgroup_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_many
    type: left_outer
    sql_on: ${scl_marketing_master_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }
}

explore: tl_touchpoint_data {
  label: "Tea Leaves Reporting"
}
