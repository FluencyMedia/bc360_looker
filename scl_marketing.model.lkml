include: "bc360_admin.model.lkml"

label: "BC360 - SCL Health"

explore: scl_marketing_master_day {
  label: "SCL Marketing - Master [Daily]"
  hidden: yes

  join: arch_program {
    relationship: one_to_many
    type: full_outer
    sql_on: ${arch_program.adgroup_id} = ${scl_marketing_master_day.adgroup_id} ;;
  }

  join: arch_clients {
    relationship: one_to_many
    type: full_outer
    sql_on: ${arch_clients.organization_id} = ${arch_program.organization_id} ;;
  }

  join: arch_outcomes {
    relationship: one_to_many
    type: full_outer
    sql_on: ${scl_marketing_master_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }
}

explore: scl_marketing_master_day_02 {
  from: arch_clients
  label: "SCL Marketing - Master [TEST]"
  hidden: yes

  join: arch_program {
    relationship: one_to_many
    type: left_outer
    sql_on: ${scl_marketing_master_day_02.organization_id} = ${arch_program.organization_id} ;;
  }

  join: scl_marketing_master_day {
    relationship: one_to_many
    type: inner
    sql_on: ${arch_program.adgroup_id} = ${scl_marketing_master_day.adgroup_id} ;;
  }

  join: arch_outcomes {
    relationship: many_to_one
    type: left_outer
    sql_on: ${scl_marketing_master_day.outcome_tracker_id} = ${arch_outcomes.outcome_tracker_id} ;;
  }
}
