view: tl_touchpoint_subtotals {
  #This sql table name is used to create a duplicate copy of the data. When rowType is null, fields from this view will resolve to 'SUBTOTAL'
  sql_table_name: (select '' as row_type union select null as row_type) ;;

  #used in sql parameters below to re-assign values to 'SUBTOTAL' on subtotal rows
  dimension: row_type_checker {
    view_label: "Y - Subtotals"
    group_label: "Z - Meta"
    label: "Row Type Checker"

    hidden: no

    sql: ${TABLE}.row_type ;;
  }

  # used for readability in sql_where of nested subtotal join
  dimension: row_type_description {
    view_label: "Y - Subtotals"
    group_label: "Z - Meta"
    label: "Row Type Description"

    hidden: no

    sql:coalesce(${TABLE}.row_type,'SUBTOTAL');;
  }

  dimension: subtype_label {
    view_label: "Y - Subtotals"
    label: "Subtype"

    sql: ${arch_program.rel_program_main} ;;

    html:{% if subtotal_over.row_type_description._value == 'SUBTOTAL' %}
            <div style="
              background: rgba(70, 130, 180, 0.4);
              width: 100%;
              height: 20px;
              padding: 3px 3px 1px;
              border-bottom: 1px solid black;
              margin:18px 0 0 0;
              font-size: 110%;
              color:black
            ">
            <b><span>{{ rendered_value }}</span></b>
            </div>
          {% else %}
            &nbsp;
          {% endif %};;
  }

  dimension: rel_program_detail_sub {
    view_label: "Y - Subtotals"
    label: "+ [[Detail]]"

    order_by_field: rel_program_detail_order

    # For subtotal rows: show 'SUBTOTAL'.  For nulls, show '∅' (supports intuitive sorting).  Otherwise use raw base table field's data. Note, concatenation with '${row_type_checker}' is used to concisely force subtotal rows to evaluate to null, which is then converted to 'SUBTOTAL'
    sql: coalesce(cast(coalesce(cast(${arch_program.rel_program_detail} as varchar),'∅')||${row_type_checker} as varchar),'SUBTOTAL');;

  }

  dimension: rel_program_detail_order {
    view_label: "Y - Subtotals"
    group_label: "Z - Meta"
    label: "Program Detail Order"

    hidden: no

    #For order by fields, use a similar calculation, but use values that correctly put nulls at min and subtotals at max of sort order positioning
    sql: coalesce(cast(coalesce(cast(${arch_program.rel_program_detail} as varchar),'ZZZZZZZZZZ')||${row_type_checker} as varchar),'          ');;

    html: {% if subtotal_over.row_type_description._value == 'SUBTOTAL' %}
            <div style="
              background: rgba(70, 130, 180, 0.4);
              width: 100%;
              height: 20px;
              padding: 3px 3px 1px;
              border-bottom: 1px solid black;
              margin:18px 0 0 0;
              font-size: 110%;
              color:black
            ">
            &nbsp;
            </div>
          {% else %}
            {{ rendered_value }}
          {% endif %};;


    }
  }
