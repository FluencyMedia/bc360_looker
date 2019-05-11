include: "mx_marketing_base.view.lkml"

view: mx_marketing_master_day {
  view_label: "BH - Master [Daily]"
  extends: [mx_marketing_base]

  derived_table: {
    # datagroup_trigger: dg_bc360_bq

    sql:  SELECT
            *
          FROM flat_mx.mx_marketing_master_hour mxmmd;;
  }

  dimension: hour_of_day {
    view_label: "4. Timeframes"
    label: "Hour of Day"
    description: "0 - 23: To use as hidden sort index for 'time_of_day'"

    type: number
    value_format_name: decimal_0

    sql: ${TABLE}.hour ;;
  }

  dimension: time_of_day {
    view_label: "4. Timeframes"
    label: "Time of Day"
    description: "'Midnight' - '6AM' - 'Noon'"

    type: string

    case: {
      when: {
        sql: ${hour_of_day} = 0 ;;
        label: "Midnight"
      }
      when: {
        sql: ${hour_of_day} = 1 ;;
        label: "1AM"
      }
      when: {
        sql: ${hour_of_day} = 2 ;;
        label: "2AM"
      }
      when: {
        sql: ${hour_of_day} = 3 ;;
        label: "3AM"
      }
      when: {
        sql: ${hour_of_day} = 4 ;;
        label: "4AM"
      }
      when: {
        sql: ${hour_of_day} = 5 ;;
        label: "5AM"
      }
      when: {
        sql: ${hour_of_day} = 6 ;;
        label: "6AM"
      }
      when: {
        sql: ${hour_of_day} = 7 ;;
        label: "7AM"
      }
      when: {
        sql: ${hour_of_day} = 8 ;;
        label: "8AM"
      }
      when: {
        sql: ${hour_of_day} = 9 ;;
        label: "9AM"
      }
      when: {
        sql: ${hour_of_day} = 10 ;;
        label: "10AM"
      }
      when: {
        sql: ${hour_of_day} = 11 ;;
        label: "11AM"
      }
      when: {
        sql: ${hour_of_day} = 12 ;;
        label: "Noon"
      }
      when: {
        sql: ${hour_of_day} = 13 ;;
        label: "1PM"
      }
      when: {
        sql: ${hour_of_day} = 14 ;;
        label: "2PM"
      }
      when: {
        sql: ${hour_of_day} = 15 ;;
        label: "3PM"
      }
      when: {
        sql: ${hour_of_day} = 16 ;;
        label: "4PM"
      }
      when: {
        sql: ${hour_of_day} = 17 ;;
        label: "5PM"
      }
      when: {
        sql: ${hour_of_day} = 18 ;;
        label: "6PM"
      }
      when: {
        sql: ${hour_of_day} = 19 ;;
        label: "7PM"
      }
      when: {
        sql: ${hour_of_day} = 20 ;;
        label: "8PM"
      }
      when: {
        sql: ${hour_of_day} = 21 ;;
        label: "9PM"
      }
      when: {
        sql: ${hour_of_day} = 22 ;;
        label: "10PM"
      }
      when: {
        sql: ${hour_of_day} = 23 ;;
        label: "11PM"
      }
      else: "[UNKNOWN]"
      }
  }

}
