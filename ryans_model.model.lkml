connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: users {

  join: user_data {
    sql_on: ${users.id} = ${user_data.user_id} ;;
    type: left_outer
    relationship: one_to_one
    view_label: "Users"
  }

}

explore: order_items {
  join: orders {
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: inventory_items {
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
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
