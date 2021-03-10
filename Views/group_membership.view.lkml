view: group_membership {
  sql_table_name: cmslite.user_group ;;
  drill_fields: [user_idir]

  dimension: user_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    description: "The ID of the user in CMS Lite."
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    description: "The email address of the user."
  }

  dimension: group_id {
    type: string
    sql: ${TABLE}.group_id ;;
    description: "The ID of the group in CMS Lite."
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
    description: "The name of the group in CMS Lite."
  }

  dimension: is_group_mgr {
    type: yesno
    sql: ${TABLE}.is_group_mgr ;;
    description: "Yes if the user is the group manager."
  }

  dimension: site_key {
    type: string
    sql: ${TABLE}.site_key ;;
    description: "The site in CMS Lite the group is in."
  }

  dimension: user_idir {
    type: string
    sql: ${TABLE}.user_id ;;
    description: "The CMS Lite user's IDIR."
  }

  measure: count {
    type: count
    drill_fields: [cmslite_users.user_name, cmslite_users.user_idir]
  }
}
