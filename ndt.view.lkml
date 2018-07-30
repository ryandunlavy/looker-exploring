#include: "ndt_model.model"

view: ndt {
  derived_table: {
   explore_source: order_items2 {
    column: user_id {field: users.id}
    column: item_count {field: order_items2.count}
   }
  }

dimension: user_id {
  type: number
  sql: ${TABLE}.user_id ;;
}

  dimension: item_count {
    type: number
    sql: ${TABLE}.item_count ;;
  }


}
