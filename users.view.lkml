view: users {
  derived_table: {
    sql: SELECT * FROM {% if users.table_name._is_filtered %}
    ${user_facts_pdt.SQL_TABLE_NAME}
{% else %}
  demo_db.users
{% endif %} ;;
  }


  parameter: table_name {
    type: string
  }


dimension: full_name {
  sql: CONCAT(${first_name}, ' ', ${last_name}) ;;
}

dimension: in_query {
  type: number
  sql: ${TABLE}.in_query ;;
}

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  measure: sumage {
    type: yesno
    sql: CASE WHEN SUM(${age}) > 100 THEN TRUE ELSE FALSE END ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }



  measure: over_30_count {
    type: count
    filters: {
      field: age
      value: "> 30"
    }
    drill_fields: [detail*]
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
