view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    hidden: no
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format: "$0.00"
  }

  dimension: returned_flag {
    type: yesno
    sql: ${returned_date} IS NOT NULL ;;
  }


  measure: return_rate {
    type: average
    sql: CASE WHEN ${returned_raw} IS NULL THEN 0 ELSE 1 END ;;
    value_format: "0.00%"
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }

  measure: min_price {
    label: "Lowest Priced Item"
    description: "The lowest item price of all the order items in the grouping"
    type: min
    sql: ${sale_price} ;;
    value_format: "$0.00"
    drill_fields: [id,  products.id, products.item_name, returned_flag, sale_price]
  }

  measure: max_price {
    label: "Highest Priced Item"
    description: "The highest price of all the order items in the grouping"
    type: max
    sql: ${sale_price} ;;
    value_format: "$#,##0.00"
    drill_fields: [id,  products.id, products.item_name, returned_flag, sale_price]
  }

  measure: total_price {
    type:  sum
    sql: ${sale_price} ;;
    value_format: "$#,##0.00"
    drill_fields: [id,  products.id, products.item_name, returned_flag, sale_price]
  }

  measure: average_price {
    type: average
    sql: ${sale_price} ;;
    value_format: "$#,##0.00"
    drill_fields: [id,  products.id, products.item_name, returned_flag, sale_price]
  }

 measure: price_range {
  label: "Range of Prices"
  description: "The difference between the lowest and highest priced item in the grouping"
  type: number
  sql: ${max_price} - ${min_price} ;;
  value_format: "$#,##0.00"
  drill_fields: [id,  products.id, products.item_name, returned_flag, sale_price]
 }



}
