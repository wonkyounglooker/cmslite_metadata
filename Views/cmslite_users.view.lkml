view: cmslite_users {
  sql_table_name: cmslite.user_status ;;
  drill_fields: [id, user_idir, user_name, organization]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    drill_fields: [user_name, user_idir]
    description: "The ID of the user in CMS Lite."
  }

  dimension_group: created_dt {
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
    sql: ${TABLE}.created_dt ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    description: "The email address of the user."
  }

  dimension: organization {
    type: string
    sql: ${TABLE}.organization ;;
    description: "The organization the user belongs to."
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "The status of the user in CMS Lite."
  }

  dimension: user_idir {
    type: string
    sql: ${TABLE}.user_id ;;
    description: "The CMS Lite user's IDIR."
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
    description: "The CMS Lite user's full name and organization."
    drill_fields: [group_membership.group_name]
  }

  measure: count {
    type: count
    drill_fields: [id, user_name]
  }
}
