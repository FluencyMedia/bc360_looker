label: "BC360 - SCL Health"

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

explore: scl_mx_marketing_master_day {
  from: arch_clients
  view_label: "Beaumont Health"
  label: "SCL Marketing - Master [Daily]"

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
