include: "mx_marketing_base.view.lkml"

view: bh_marketing_master_day {
  view_label: "BH - Marketing [Daily]"
  extends: [mx_marketing_base]

  derived_table: {
    datagroup_trigger: dg_bc360_bq

    sql:  SELECT
            mxm.*
          FROM bc360_mx_marketing.mx_marketing_master mxm
          LEFT JOIN bc360_arch_marketing.arch_program ap ON mxm.adgroup_id = ap.adgroup_id
          LEFT JOIN bc360_arch_clients.arch_clients ac ON ap.organization_id = ac.organization_id
          WHERE ac.client_id = 'CLIENT-00001';;
    }

}
