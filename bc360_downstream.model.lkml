include: "bc360_admin.model.lkml"

label: "BC360 - All Clients"

persist_with: dg_bc360_tl

explore: mx_downstream_tl_sum {}
