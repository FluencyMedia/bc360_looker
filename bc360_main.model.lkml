label: "BC360 - Official"

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

explore: bc360_marketing_day {
  from: arch_clients
  label: "BC360 - Master [Daily]"

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${bc360_marketing_day.organization_id} = ${arch_program.organization_id} ;;
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


explore: bc360_marketing_core {
  from: arch_clients
  label: "BC360 - Core [Daily]"

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${bc360_marketing_core.organization_id} = ${arch_program.organization_id} ;;
  }

  join: mx_marketing_core_day {
    relationship: one_to_many
    type: left_outer
    sql_on: ${arch_program.adgroup_id} = ${mx_marketing_core_day.adgroup_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_many
    type: left_outer
    sql_on: ${mx_marketing_core_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }
}

explore: bc360_marketing_bh_day {
  from: arch_clients
  label: "BH - Master [Daily]"

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${bc360_marketing_bh_day.organization_id} = ${arch_program.organization_id} ;;
  }

  join: mx_bh_marketing_day {
    relationship: one_to_many
    type: left_outer
    sql_on: ${arch_program.adgroup_id} = ${mx_bh_marketing_day.adgroup_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_many
    type: left_outer
    sql_on: ${mx_bh_marketing_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }

}

explore: tl_touchpoint_data {
  label: "Tea Leaves Reporting"
}
