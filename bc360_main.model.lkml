label: "BC360 - Official"

connection: "bc360_bq_data"

datagroup: dg_bc360_bq {
  sql_trigger:  SELECT
                  MAX(trg.last_updated)
                FROM (
                  SELECT ac.last_updated from bc_arch_main.arch_clients ac
                  UNION ALL
                  SELECT ac.last_updated from bc_arch_main.arch_outcomes ao
                  UNION ALL
                  SELECT ac.last_updated from bc_arch_main.arch_program ap
                ) trg ;;
  max_cache_age: "24 hours"
}

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
