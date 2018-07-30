
view: user_facts_pdt {
  derived_table: {
    sql: SELECT
        user_id as user_id
        , COUNT(*) as lifetime_orders
        , MAX(orders.created_at) as latest_order_date
        , MIN(orders.created_at) as first_order_date
        , DATEDIFF( CURDATE(), MIN(orders.created_at)) AS days_since_first_purchase
        , DATEDIFF( CURDATE(), MIN(orders.created_at)) > 1 as repeat_customer
        , COUNT(DISTINCT MONTH(orders.created_at)) as months_with_orders
      FROM orders
      GROUP BY user_id
      ;;
    persist_for: "5 minutes"
    indexes: ["user_id"]
  }



dimension: user_id {
  type: number
  sql: ${TABLE}.user_id ;;
}

dimension: lifetime_orders {
  type: number
  sql: ${TABLE}.lifetime_orders ;;
}

dimension: latest_order_date {
  type: date
  sql: ${TABLE}.latest_order_date ;;
}

dimension: first_order_date {
  type: date
  sql: ${TABLE}.first_order_date ;;
}

dimension: days_since_first_purchase {
  type: number
  sql: ${TABLE}.days_since_first_purchase ;;
}

dimension: repeat_customer {
  type: yesno
  sql: ${TABLE}.repeat_customer ;;
}

dimension: months_with_orders {
  hidden: yes
  type: number
  sql: ${TABLE}.months_with_orders ;;
}

dimension: orders_per_month {
  type: number
  sql: ${lifetime_orders}/${months_with_orders} ;;
}



}
