include: "bc360_admin.model.lkml"

label: "BC360 - Beaumont Health"

persist_with: dg_bc360_tl

explore: mx_downstream_tl_sum {
  label: "CRM - Touchpoints"
  hidden: yes

  join: map_services_tl {
    relationship: many_to_one
    type: left_outer

    sql_on: ${mx_downstream_tl_sum.campaign_service} = ${map_services_tl.campaign_service} ;;
  }

  join: arch_program {
    relationship: many_to_one
    type: left_outer

    sql_on: ${map_services_tl.service_line_code} = ${arch_program.service_line_code} ;;
  }

}
