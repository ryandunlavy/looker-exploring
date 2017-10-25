view: user_data {
  sql_table_name: demo_db.user_data ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: max_num_orders {
    type: number
    sql: ${TABLE}.max_num_orders ;;
  }

  dimension: total_num_orders {
    type: number
    sql: ${TABLE}.total_num_orders ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: has_ever_ordered {
    type:  yesno
    sql: ${total_num_orders} <> 0 ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id]
  }
}
