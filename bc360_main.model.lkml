include: "bc360_admin.model.lkml"

label: "BC360 - LEGACY"

persist_with: dg_bc360_bq


explore: bc360_marketing_master_day {
  from: arch_clients
  label: "BC360 - Master [LEGACY]"
  hidden: yes

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${bc360_marketing_master_day.organization_id} = ${arch_program.organization_id} ;;
  }

  join: mx_marketing_master_day {
    relationship: one_to_many
    type: inner
    sql_on: ${arch_program.adgroup_id} = ${mx_marketing_master_day.adgroup_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_one
    type: left_outer
    sql_on: ${mx_marketing_master_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }
}


explore: tl_touchpoint_data {
  label: "Tea Leaves Reporting"
  hidden: yes
}

explore: map_services {
  group_label: "BC360 - Admin"
  label: "BC360 - Program/Service Check"
  hidden: yes

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${map_services.service_line_code} = ${arch_program.service_line_code} ;;
  }


}
