view: simple_pdt {

  derived_table: {
    sql: SELECT {{ simple_pdt.param._parameter_value }} as total
      ;;
  }

  parameter: param {
    type: string
  }

  dimension: total {
    type: string
    sql: ${TABLE}.total ;;
  }



}
