include: "mx_marketing.view.lkml"

view: mx_marketing_bh_day {
  view_label: "BH - Marketing [Daily]"
  extends: [mx_marketing]

  derived_table: {
    datagroup_trigger: dg_bc360_bq

    sql:  SELECT
            *
          FROM bc360_mx_marketing.mx_marketing_master mxm
          WHERE mxm.client_id = 'CLIENT-00001';;
    }

}
