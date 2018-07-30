connection: "thelook"

# include all the views
include: "*.view"

explore: inventory_items {
#   join: users {
#     type: cross
#     relationship: many_to_many
#   }
}

explore: special_character_test_1 {}

explore: test1 {
}
view: test1 {
  derived_table: {
    sql: SELECT "test, test" AS test
         UNION
        SELECT "test test" AS test;;
  }
  dimension: test {
    sql: ${TABLE}.test ;;
  }

  measure: count {
    type: count
    filters: {
      field: test1.test
      value: "%^,%"
    }
  }
}
explore: parent_pdt {}

explore: user_data {}
