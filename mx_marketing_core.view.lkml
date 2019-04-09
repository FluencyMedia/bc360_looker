include: "mx_marketing.view.lkml"

view: mx_marketing_core {
  extends: [mx_marketing]

  derived_table: {

    datagroup_trigger: dg_bc360_bq

    sql: SELECT
            ##### DIMENSIONS
            FORMAT("%s-%s","MXMC", GENERATE_UUID()) AS row_id,
            mxaw.date,
            mxaw.medium,
            mxaw.client_id,
            mxaw.adgroup_id,
            mxaw.adgroup_uid,
            mxaw.outcome_tracker_id,
            mxaw.outcome_tracker_uid,

            ##### MEASURES
            NULLIF(SUM(mxaw.impressions),0) impressions,
            NULLIF(SUM(mxaw.clicks),0) clicks,
            NULLIF(SUM(mxaw.cost),0) cost,
            NULLIF(SUM(mxaw.outcomes_bulk),0) outcomes_bulk,
            NULLIF(SUM(outcomes),0) outcomes
          FROM `bc-aw-source.bc360_mx_marketing.mx_marketing_master` mxaw
          GROUP BY
            mxaw.date,
            mxaw.medium,
            mxaw.client_id,
            mxaw.adgroup_id,
            mxaw.adgroup_uid,
            mxaw.outcome_tracker_id,
            mxaw.outcome_tracker_uid ;;
  }

}
