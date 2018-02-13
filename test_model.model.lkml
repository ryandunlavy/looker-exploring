connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"


datagroup: orders_update {
  sql_trigger: SELECT MAX(created) FROM orders ;;
  max_cache_age: "4 hours"
}

explore: inv_extended {
  fields: [ALL_FIELDS*, -inv_extended.test_set*]
}

explore: test123 {}


explore: orders {
  join: inventory_items {
    sql_on: ${inventory_items.date_string} = ${orders.date_string};;
    type: left_outer
    relationship: many_to_many
  }
}
