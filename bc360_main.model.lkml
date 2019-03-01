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
                  SELECT ao.last_updated from bc_arch_main.arch_outcomes ao
                  UNION ALL
                  SELECT ap.last_updated from bc_arch_main.arch_program ap
                ) trg ;;
  max_cache_age: "24 hours"
}

persist_with: dg_bc360_bq

explore: arch_clients {
  label: "Clients"
}
