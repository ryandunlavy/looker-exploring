view: special_character_test_1 {
  derived_table: {
    sql: SELECT 'emdash —' as emdash, 'non-breaking test' as nonbreaking
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: emdash {
    type: string
    sql: ${TABLE}.emdash ;;
  }

  dimension: nonbreaking {
    type: string
    sql: ${TABLE}.nonbreaking ;;
  }

  measure: with_nonbreaking {
    type: count
    filters: {
      field: nonbreaking
      value: "non-breaking test"
    }
  }

  measure: without_nonbreaking {
    type: count
    filters: {
      field: nonbreaking
      value: "non-breaking test"
    }
  }

  set: detail {
    fields: [emdash, nonbreaking]
  }
}
