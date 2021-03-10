view: cmslite_groups {
  sql_table_name: cmslite.cms_group ;;
  drill_fields: [id, site_key, active]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    description: "The ID of the group in CMS Lite."
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
    description: "The status of the group."
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the group in CMS Lite."
    drill_fields: [cmslite_users.user_name, cmslite_users.user_idir]
  }

  dimension: site_key {
    type: string
    sql: ${TABLE}.site_key ;;
    description: "The site in CMS Lite the group is in."
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
