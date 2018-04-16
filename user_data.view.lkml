view: user_data {
  sql_table_name: demo_db.user_data ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  filter: yesno_filter {
    type: yesno
    sql: {% condition yesno_filter %} ${more_than_5_orders} {% endcondition %}  ;;
  }

  measure: money {
    type: sum
    #html: {% assign var=_filters['dynamic_parameter'] %}{{var}}{{rendered_value}};;
    sql: ${total_num_orders} ;;
    drill_fields: [yesno_filter, orders, rders]
    value_format: "0.00"
  }

  dimension: other_view {
    sql: 1 ;;
  }

  parameter: dynamic_parameter {
    type: unquoted
    allowed_value: {
      label: "Pound"
      value: "&pound;"
    }
    allowed_value: {
      label: "Euro"
      value: "&euro;"
    }
  }

  dimension: param_value {
    #hidden: yes
    type: string
    sql: {% parameter dynamic_parameter %} ;;
  }

  dimension: more_than_5_orders{
    type: yesno
    sql: ${total_num_orders} > 5 ;;
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

  dimension: user_id_2 {
    type: string
    # hidden: yes
    sql: to_char(${TABLE}.user_id, '999') ;;
  }

  dimension: has_ever_ordered {
    label: "Has placed an order"
    description: "Says 'yes' when the user has ever placed an order, 'no' when the user has never placed an order"
    type:  yesno
    sql: ${total_num_orders} <> 0 ;;
  }


  dimension: order_tier {
    label: "Number of orders (tiered)"
    description: "Number of orders by a user broken up into tiers of 0-4, 5-9, 10-14, 15-19, 20-24 and 25+"
    type: tier
    tiers: [5, 10, 15, 20, 25]
    style: integer
    sql: ${total_num_orders} ;;
  }

  dimension: orders {
    type: number
    sql: ${total_num_orders} ;;
  }

  measure: rders {
    type: sum
    sql: ${total_num_orders} ;;
    drill_fields: [order_tier]
  }


  measure: test {
    type: number
    sql: ${user_data.orders}/${max_num_orders};;
  }




  measure: count {
    hidden: yes
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id]
  }
}
