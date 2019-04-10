include: "mx_marketing_base.view.lkml"

view: mx_bh_marketing_day {
  view_label: "BH - Marketing [Daily]"
  extends: [mx_marketing_base]

  derived_table: {
    datagroup_trigger: dg_bc360_bq

    sql:  SELECT
            FORMAT("%s-%s","MXMBH", GENERATE_UUID()) AS row_id,
            mxm.date,
            mxm.medium,
            mxm.adgroup_id,
            mxm.adgroup_uid,
            mxm.outcome_tracker_id,
            mxm.outcome_tracker_uid,
            mxm.creative_id,
            mxm.criterion_id,
            mxm.device,
            mxm.impressions,
            mxm.cost,
            mxm.clicks,
            mxm.outcomes,
            mxm.outcomes_bulk
          FROM bc360_mx_marketing.mx_marketing_master mxm
          LEFT JOIN bc360_src_arch_marketing.arch_program ap ON mxm.adgroup_id = ap.adgroup_id
          LEFT JOIN bc360_src_arch_clients.arch_clients ac ON ap.organization_id = ac.organization_id
          WHERE ac.client_id = 'CLIENT-00001'';;
    }

}
