connection: "bc360_bq_data"

include: "*.view.lkml"


datagroup: dg_bc360_bq {
  sql_trigger:  SELECT
                  last_modified_time last_modified
                FROM `bc-aw-source.INFORMATION_SCHEMA.SCHEMATA`
                WHERE schema_name = 'bc360_mx_marketing' ;;
  max_cache_age: "24 hours"
}

datagroup: dg_bc360_flat {
  sql_trigger:  SELECT
                  last_modified_time last_modified
                FROM `bc360-main.INFORMATION_SCHEMA.SCHEMATA`
                WHERE schema_name = 'flat_mx' ;;
  max_cache_age: "24 hours"
}

datagroup: dg_bc360_arch {
  sql_trigger:  SELECT
                  MAX(last_modified_time) last_modified
                FROM `bc360-main.INFORMATION_SCHEMA.SCHEMATA`
                WHERE schema_name LIKE 'arch_%' ;;
  max_cache_age: "24 hours"
}

datagroup: dg_bc360_tl {
  sql_trigger:  SELECT
                  MAX(trg.last_updated)
                FROM bc360_mx_downstream.mx_downstream_tl_sum trg;;
}
