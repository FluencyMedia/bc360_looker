connection: "bc360_bq_data"

include: "*.view.lkml"

datagroup: dg_bc360_bq {
  sql_trigger:  SELECT
                  MAX(trg.trigger_stamp)
                FROM (SELECT
                        trigger_stamp
                      FROM bc360_admin_data.bc360_admin_trigger_lastupdate) trg ;;
  max_cache_age: "24 hours"
}

datagroup: dg_bc360_tl {
  sql_trigger:  SELECT
                  MAX(trg.last_updated)
                FROM bc360_mx_downstream.mx_downstream_tl_sum trg;;
}
