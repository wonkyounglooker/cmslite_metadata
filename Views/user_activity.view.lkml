view: user_activity {
  sql_table_name: cmslite.user_activity ;;

  dimension_group: activity {
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
    sql: ${TABLE}.activity_date ;;
  }

  dimension: activity_type {
    type: string
    sql: ${TABLE}.activity_type ;;
    drill_fields: [user_idir, group_name, memo, activity_type]
    description: "The activity that occurred within CMS Lite"
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
    description: "The name of the group in CMS Lite"
    drill_fields:[cmslite_users.user_name, user_idir]
  }

  dimension: memo {
    type: string
    sql: ${TABLE}.memo ;;
    description: "The description of the activity."
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
    description: "The CMS Lite ID of the user."
  }

  dimension: user_idir {
    type: string
    sql: ${TABLE}.user_idir ;;
    description: "The CMS Lite user's IDIR."
  }

  dimension: primary_key {
    primary_key: yes
    sql: ${TABLE}.activity_type || ${TABLE}.group_name || ${TABLE}.user_idir ;;
  }

  measure: count {
    type: count
    drill_fields: [user_idir, group_name]
  }
}
