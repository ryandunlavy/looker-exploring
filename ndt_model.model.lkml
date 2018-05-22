connection: "thelook"
#test
#
#
# # include all the views
# include: "*.view"
# include: "ndt.view"
#
#
# explore: order_items2 {
#   hidden: yes
#   from: order_items
#   label: "Orders"
#
#
#   join: inventory_items {
#     sql_on: ${inventory_items.id} = ${order_items2.inventory_item_id} ;;
#     type: left_outer
#     relationship: many_to_many
#   }
#
#   #will this stay??
#
#   join: orders {
#     sql_on: ${orders.id} = ${order_items2.order_id} ;;
#     type: left_outer
#     relationship: many_to_one
#   }
#
#   join: products {
#     sql_on: ${products.id} = ${inventory_items.product_id} ;;
#     type: left_outer
#     relationship: many_to_one
#   }
#
#   join: users {
#     sql_on: ${users.id} = ${orders.user_id} ;;
#     type:  left_outer
#     relationship: many_to_one
#   }
#
#   join: user_data {
#     sql_on: ${users.id} = ${user_data.user_id} ;;
#     type: inner
#     relationship: many_to_one
#     view_label: "Users"
#   }
# }
