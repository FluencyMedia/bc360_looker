label: "BC360 - Beaumont Health"

connection: "bc360_bq_data"
include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: tl_touchpoint_data {
  label: "Tea Leaves Reporting"
}
