include: "mx_marketing_base.view.lkml"

view: mx_marketing_core_day {
  view_label: "BH - Core [Daily]"
  extends: [mx_marketing_base]

  derived_table: {
    datagroup_trigger: dg_bc360_bq

    sql:  SELECT
            *
          FROM bc360_mx_marketing.mx_marketing_core_day mxmcd;;
  }

}
