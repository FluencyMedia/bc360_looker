include: "bc360_admin.model.lkml"

label: "BC360 - Beaumont Health"

persist_with: dg_bc360_bq

explore: bh_marketing_master_day {
  label: "BH Marketing - Master [Daily]"

  join: arch_program {
    relationship: many_to_one
    type: left_outer
    sql_on: ${arch_program.adgroup_id} = ${bh_marketing_master_day.adgroup_id} ;;
  }

  join: arch_clients {
    relationship: many_to_one
    sql_on: ${arch_clients.organization_id} = ${arch_program.organization_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_one
    sql_on: ${arch_outcomes.outcome_tracker_id} = ${bh_marketing_master_day.outcome_tracker_id} ;;
  }
}


explore: tl_touchpoint_data {
  label: "Tea Leaves Reporting"
}
