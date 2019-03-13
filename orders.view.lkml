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
    html: <a target="new" href="https://www.google.com/"</a>;;
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
    label: "{% if _view._name == 'self_join' %} Self Join dimension {% else %} Orders dimension {% endif %}"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    group_label: "{% if  _view._name == 'self_join' %} Self Join {{ _field._name }} {% else %} Orders {% endif %}"
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: order_count {
    link: {
      label: "Order counts"
      url: "/ryans_model/order_items?fields=order_items.average_price,order_items.returned_date,order_items.max_price&f[order_items.returned_date]=10+days&sorts=order_items.returned_date+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%22stacking%22%3A%22normal%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22legend_position%22%3A%22center%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Atrue%2C%22limit_displayed_rows%22%3Afalse%2C%22y_axis_combined%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22show_null_points%22%3Atrue%2C%22point_style%22%3A%22none%22%2C%22interpolation%22%3A%22linear%22%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_area%22%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22order_items.average_price%22%3A%22Average+Price+Label%22%2C%22order_items.max_price%22%3A%22Highest+Price+Label%22%7D%7D&filter_config=%7B%22order_items.returned_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2210%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded"
    }
    type: count
    #html: <p style="font-size:100px">{{ value}}</p> ;;
  }

  measure: order_count1 {
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]
    #html: <p style="font-size:100px">{{ value}}</p> ;;
  }
}
