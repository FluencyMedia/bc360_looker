include: "mx_marketing.view.lkml"

view: mx_marketing_bh_day {
  extends: [mx_marketing]

  derived_table: {
    datagroup_trigger: dg_bc360_bq

    sql:  SELECT
            FORMAT("%s-%s","MXM", GENERATE_UUID()) AS row_id,
            date,
            medium,
            client_id,
            adgroup_id,
            adgroup_uid,
            outcome_tracker_id,
            outcome_tracker_uid,
            creative_id,
            criterion_id,
            device,
            impressions,
            cost,
            clicks,
            outcomes,
            outcomes_bulk
          FROM bc360_mx_marketing.mx_marketing_master mxm
          WHERE mxm.client_id = 'CLIENT-00001';;

          indexes: ["row_id", "adgroup_id", "date", "outcome_tracker_id", "mode"]
    }

}
