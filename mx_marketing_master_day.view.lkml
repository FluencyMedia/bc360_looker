include: "mx_marketing_base.view.lkml"

view: mx_marketing_master_day {
  view_label: "BH - Master [Daily]"
  extends: [mx_marketing_base]

  derived_table: {
    # datagroup_trigger: dg_bc360_bq

    sql:  SELECT
            *
          FROM flat_mx.mx_marketing_master mxmmd;;
  }

}
