view: mx_downstream_tl_sum {
  label: "Tea Leaves - Summary"

  derived_table: {
    datagroup_trigger: dg_bc360_tl

    sql:  SELECT
            tls.*
          FROM bc360_mx_downstream.mx_downstream_tl_sum tls;;
  }

  dimension: campaign_service {
    label: "Campaign / Service"

    hidden: yes

    type: string
    sql: ${TABLE}.campaign_service ;;
  }

  dimension: patient_type {
    label: "Patient Type"

    type: string
    sql: ${TABLE}.patient_type ;;
  }

  dimension: row_id {
    hidden: yes

    primary_key: yes

    type: string
    sql: ${TABLE}.row_id ;;
  }

  dimension: subtype {
    label: "Subtype"

    type: string
    sql: ${TABLE}.subtype ;;
  }

  dimension: subtype_list {
    label: "Subtype List"

    type: string
    sql: ${TABLE}.subtype_list ;;
  }

  dimension: touchpoint_type {
    label: "Touchpoint Type"

    type: string
    sql: ${TABLE}.touchpoint_type ;;
  }

  measure: charges_sum {
    label: "$ Charges"

    type: sum
    value_format_name: decimal_0

    sql: NULLIF(${TABLE}.charges, 0) ;;
  }

  measure: payments_sum {
    label: "$ Payments"

    type: sum
    value_format_name: decimal_0

    sql: NULLIF(${TABLE}.payments, 0) ;;
  }

  measure: individuals_sum {
    label: "# Individuals"

    type: sum
    value_format_name: decimal_0

    sql: NULLIF(${TABLE}.individuals, 0) ;;
  }

  measure: encounters_sum {
    label: "# Encounters"

    type: sum
    value_format_name: decimal_0

    sql: NULLIF(${TABLE}.encounters, 0) ;;
  }

  measure: unreimbursed_sum {
    label: "$ Unreimbursed"

    type: number
    value_format_name: decimal_0

    sql: ${charges_sum} - ${payments_sum} ;;
  }

  measure: payments_per_ind {
    label: "$ Pymt/Ind"

    type: number
    value_format_name: usd_0

    sql: ${payments_sum} / nullif(${individuals_sum},0) ;;
  }

  measure: charges_per_ind {
    label: "$ Chrgs/Ind"

    type: number
    value_format_name: usd_0

    sql: ${charges_sum} / nullif(${individuals_sum},0) ;;
  }

  measure: unreimbursed_per_ind {
    label: "$ Unreimb/Ind"

    type: number
    value_format_name: usd_0

    sql: ${unreimbursed_sum} / nullif(${individuals_sum},0) ;;
  }

  measure: encounters_per_ind {
    label: "$ Enctrs/Ind"

    type: number
    value_format_name: usd_0

    sql: ${encounters_sum} / nullif(${individuals_sum},0) ;;
  }
}
