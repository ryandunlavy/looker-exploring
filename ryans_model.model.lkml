connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: orders_update {
  sql_trigger: SELECT MAX(created) FROM orders ;;
  max_cache_age: "4 hours"
}

explore: users {

  join: user_data {
    sql_on: ${users.id} = ${user_data.user_id} ;;
    type: inner
    relationship: one_to_one
    view_label: "Users"
  }

}

explore: orders_2017 {
  from: order_items

  sql_always_where: ${orders.created_date} >= '01-01-2017' ;;

  persist_with: orders_update

  join: orders {
    sql_on: ${orders.id} = ${orders_2017.order_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: inventory_items {
    sql_on: ${inventory_items.id} = ${orders_2017.inventory_item_id} ;;
    type: left_outer
    relationship: many_to_many
  }

  join: products {
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: users {
    sql_on: ${users.id} = ${orders.user_id} ;;
    type:  left_outer
    relationship: many_to_one
  }
}
