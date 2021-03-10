view: metadata_content_types {
  sql_table_name: cmslite.metadata_content_types ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: node_id {
    type: string
    sql: ${TABLE}.node_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
