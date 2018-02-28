#view: test  {
#   derived_table: {
#     sql:
#       SELECT * FROM (SELECT 'foo' as some_string, 1 as some_num
#       UNION ALL
#       SELECT 'bar' as some_string, 2 as some_num
#       UNION ALL
#       SELECT 'bar' as some_string, 3 as some_num
#       UNION ALL
#       SELECT NULL as some_string, 4 as some_num)
#       ;;
#   }
#
#    measure: test_measure {
#     type: number
#     sql: {{ test_param }} ;;
#   }
#
#   parameter: test_param {
#     type: unquoted
#     allowed_value: {
#       label: "count"
#       value: "${count}"
#     }
#   }
#
#   dimension: some_string {
#     type: string
#   }
#
#   dimension: some_num {
#     type: number
#   }
#
#   measure: count {
#     type: count
#   }



#}

view: test  {
  derived_table: {
    sql:
      SELECT 'foo' as some_string, 1 as some_num
      UNION ALL
      SELECT 'bar' as some_string, 2 as some_num
      UNION ALL
      SELECT 'bar' as some_string, 3 as some_num
      UNION ALL
      SELECT 'yes' as some_string, {{ "2015" | convert: "number" }} as some_num;;
  }


  dimension: some_string {
    type: string
  }

  parameter: test_param {
    allowed_value: {
      label: "USD"
      value: "usd"
    }
    allowed_value: {
      label: "GDP"
      value: "gdp"
    }
  }



  dimension: some_num {
    type: number
  }

  measure: count {
    type: count
  }

  filter: string_filter {
    type: string
  }

  filter: number_filter {
    type: number
  }

  filter: number_filter_2 {
    type: number
  }

  parameter: number_parameter {
    type: number
  }

}
