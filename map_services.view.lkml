view: map_services {
  view_label: "Z - QA"
  label: "Program/Service Check"
  sql_table_name: bc360_arch_services.map_services ;;

  dimension: program {
    type: string
    sql: ${TABLE}.program ;;
  }

  dimension: service_line {

    type: string
    sql: ${TABLE}.service_line ;;
  }

  dimension: service_line_code {
    type: string
    sql: ${TABLE}.service_line_code ;;
  }

}
