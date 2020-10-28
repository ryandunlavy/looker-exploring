view: multi_series_bug {
  derived_table: {
    sql:  SELECT 'A' AS label, 1000 AS col_1, -1 AS col_2
          UNION ALL SELECT 'B', 800, -2
          UNION ALL SELECT 'C', 1300, -3
          UNION ALL SELECT 'D', 1400, -2
          UNION ALL SELECT 'E', 1250, -1
    ;;
  }
  dimension: label {}
  measure: col_1 {type:sum sql: ${TABLE}.col_1;; label:"Positive Values"}
  measure: col_2 {type:sum sql: ${TABLE}.col_2;; label:"Negative Values"}
}

# ACTUAL
# https://lookerv78.dev.looker.com/explore/model/multi_series_bug?qid=R8i93PYNqb8HLlkWX3QrIf&toggle=vis

# DESIRED
# https://lookerv78.dev.looker.com/explore/model/multi_series_bug?qid=VTzHZLeFBlk9gF3QPNULeO&toggle=vis
