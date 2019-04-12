view: map_services_tl {
  label: "2. Services"

  derived_table: {
    datagroup_trigger: dg_bc360_tl

    sql: SELECT * FROM bc360_arch_services.map_services_tl ;;
  }

  dimension: campaign_service {
    label: "Campaign/Service"
    type: string

    primary_key: yes

    sql: ${TABLE}.campaign_service ;;
  }

  dimension: service_line_code {
    hidden: yes
    type: string
    sql: ${TABLE}.service_line_code ;;
  }

  dimension: service_offering {
    type: string
    sql: ${TABLE}.service_offering ;;
  }
}
