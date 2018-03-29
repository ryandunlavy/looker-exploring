view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: date_string {
    type: string
    sql: DATE_FORMAT(${TABLE}.created_at, "%m-%d-%y") ;;
    html: <td nowrap>{{ value}}</td> ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day
    ]
    sql: ${TABLE}.created_at ;;
    #html: <span style="white-space: nowrap">{{ linked_value }}</span> ;;
  }

  dimension_group: current {
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
    sql: CURRENT_TIMESTAMP ;;
    #html: <span style="white-space: nowrap">{{ linked_value }}</span> ;;
  }

  dimension: day {
    type: date
    sql: DATE(${TABLE}.created_at) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: order_count {
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]
    #html: <p style="font-size:100px">{{ value}}</p> ;;
  }

  measure: order_count1 {
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]
    #html: <p style="font-size:100px">{{ value}}</p> ;;
  }
}
