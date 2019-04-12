include: "bc360_admin.model.lkml"

label: "BC360 - Beaumont Health"

persist_with: dg_bc360_tl

explore: mx_downstream_tl_sum {
  label: "CRM - Touchpoints"
}
