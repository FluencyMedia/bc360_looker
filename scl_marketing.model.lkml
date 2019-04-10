include: "bc360_admin.model.lkml"

label: "BC360 - SCL Health"

explore: scl_marketing_master_day {
  label: "SCL Marketing - Master [Daily]"

  join: arch_program {
    relationship: many_to_one
    type: left_outer
    sql_on: ${arch_program.adgroup_id} = ${scl_marketing_master_day.adgroup_id} ;;
  }

  join: arch_clients {
    relationship: many_to_one
    type: left_outer
    sql_on: ${arch_clients.organization_id} = ${arch_program.organization_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_one
    type: left_outer
    sql_on: ${scl_marketing_master_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }
}
