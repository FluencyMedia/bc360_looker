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
                ) trg ;;
  max_cache_age: "24 hours"
}

persist_with: dg_bc360_bq

explore: arch_clients {
  label: "Clients"
}

explore: arch_outcomes {
  label: "Outcomes"
}

explore: arch_program {
  label: "Programs"
}

explore: tl_touchpoint_data {
  label: "Tea Leaves Reporting"
}
