connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: users {

  join: user_data {
    sql_on: ${users.id} = ${user_data.user_id} ;;
    type: left_outer
    relationship: one_to_one
    view_label: "Users"
  }
}
