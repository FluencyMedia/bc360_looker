label: "BC360 - Official"

connection: "bc360_bq_data"
include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

datagroup: dg_bc360_bq {
  sql_trigger:  SELECT
                  MAX(trg.last_updated)
                FROM (
                  SELECT ac.last_updated from bc_arch_main.arch_clients ac
                  UNION ALL
                  SELECT last_updated from bc_arch_main.arch_outcomes
                  UNION ALL
                  SELECT last_updated from bc_arch_main.arch_program
                  UNION ALL
                  SELECT last_updated from bc_bq_data.mx_master
                ) trg ;;
  max_cache_age: "24 hours"
}

persist_with: dg_bc360_bq

explore: arch_outcomes {
  label: "Outcomes"
}

explore: arch_program {
  label: "BC360 - Master"

  join: mx_master {
    relationship: one_to_many
    type: left_outer
    sql_on: ${arch_program.adgroup_id} = ${mx_master.adgroup_id} ;;
  }
}

explore: tl_touchpoint_data {
  label: "Tea Leaves Reporting"
}
