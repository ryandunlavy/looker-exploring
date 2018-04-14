connection: "thelook"

# include all the views
include: "*.view"


# datagroup: orders_update {
#   sql_trigger: SELECT MAX(created) FROM orders ;;
#   max_cache_age: "4 hours"
# }
#
# explore: inv_extended {
#   fields: [ALL_FIELDS*, -inv_extended.test_set*]
# }
#
# explore: test123 {}
#
#
# explore: orders {
#   join: inventory_items {
#     sql_on: ${inventory_items.date_string} = ${orders.date_string};;
#     type: left_outer
#     relationship: many_to_many
#   }
# }
explore: user_test {
  from: users
  join: user_data {
    sql_on: ${user_test.id} = ${user_data.user_id} ;;
    relationship: many_to_one
  }
}
explore: parent_pdt {}
