

view: zendesk_data  {
  derived_table: {
    sql:
      SELECT 27 as zendesk_id
      UNION ALL
      SELECT 28 as zendesk_id;;
  }


  dimension: zendesk_id {
    label: "Zendesk ID"
    type: string
    sql: ${TABLE}.zendesk_id ;;
  }
  }
