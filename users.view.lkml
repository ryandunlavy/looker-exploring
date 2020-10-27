view: users {

  dimension: string {
    type: string
    #test
    sql: ${TABLE}.string ;;
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

  dimension: filter_test {
    label: "filter test"
    type: string
    case: {
      when: {
        label: "option one"
        sql: ${age} = 25 ;;
      }
      when: {
        label: "option two"
        sql: ${age} = 30 ;;
      }
    }
  }

  dimension: transaction_place_group_desc {
    label:  "   Transaction Place Group"
    suggest_persist_for: "24 hours"
    description: "On Street: City name ,Parking Lot: Vendor name"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: link_test {
    type: string
    sql: "nowhere dot com" ;;
    link: {
      label: "click me"
      url: "https://www.google.com"

    }
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

  parameter: allowed_vals {
    type: unquoted
    allowed_value: {
      label: "yes"
      value: "1"
    }
    allowed_value: {
      label: "No"
      value: "2"
    }
    # allowed_value: {
    #   label: "Maybe"
    #   value: "3"
    # }
    # allowed_value: {
    #   label: "Just Maybe"
    #   value: "4"
    # }
  }

  measure: nonsense_total {
    type: sum
    sql: case when  {%  parameter allowed_vals ==2  %}=2 then ${id}
              when  {%  parameter allowed_vals ==1  %}=1 then ${id} end ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
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
