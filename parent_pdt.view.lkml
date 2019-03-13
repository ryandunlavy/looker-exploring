
view: parent_pdt {
  derived_table: {
    sql: select * from ${user_facts_pdt.SQL_TABLE_NAME}
      ;;
      persist_for: "1 hour"
      indexes: ["user_id"]
  }



  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    primary_key: yes
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
