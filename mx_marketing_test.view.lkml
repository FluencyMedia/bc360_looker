include: "mx_marketing_base.view.lkml"

view: mx_marketing_test {
  view_label: "BH - Master [TEST]"
  extends: [mx_marketing_base]

  derived_table: {
    datagroup_trigger: dg_bc360_bq

    sql:  SELECT
            *
          FROM bc360_src_mx_ppc.mx_performance_aw;;
  }

}
