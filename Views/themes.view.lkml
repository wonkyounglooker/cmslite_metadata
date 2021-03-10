view: themes {
  sql_table_name: cmslite.themes ;;
  drill_fields: [subtheme_id]


  # the COALESCSE expression ensures that a blank value is returned in the
  # case where the ${TABLE}.subtheme_id value is missing or null; ensurinig that
  # user attribute filters will continue to work.
  #
  # reference - https://docs.aws.amazon.com/redshift/latest/dg/r_NVL_function.html

  dimension: subtheme_id {
    primary_key: yes
    description: "The alphanumeric CMS Lite subtheme identifier."
    type: string
    sql:COALESCE(${TABLE}.subtheme_id,'') ;;
  }

  dimension: hr_url {
    type: string
    sql: ${TABLE}.hr_url ;;
  }

  dimension: node_id {
    description: "The alphanumeric CMS Lite node identifier."
    type: string
    sql: ${TABLE}.node_id ;;
  }

  dimension: parent_node_id {
    description: "The alphanumeric CMS Lite node identifier of the parent node."
    type: string
    sql: ${TABLE}.parent_node_id ;;
  }

  dimension: subtheme {
    description: "The CMS Lite subtheme."
    type: string
    drill_fields: [topic]
    sql: COALESCE(${TABLE}.subtheme, '(no subtheme)') ;;
    suggest_explore: themes_cache
    suggest_dimension: themes_cache.subtheme
  }

  dimension: theme {
    description: "The CMS Lite theme."
    type: string
    drill_fields: [subtheme, topic]
    sql: COALESCE(${TABLE}.theme, '(no theme)') ;;
    suggest_explore: themes_cache
    suggest_dimension: themes_cache.theme
  }

  dimension: theme_id {
    description: "The alphanumeric CMS Lite theme identifer."
    type: string
    sql: COALESCE(${TABLE}.theme_id,'') ;;
  }

  dimension: title {
    description: "The CMS Lite page title."
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: parent_title {
    type: string
    sql: ${TABLE}.parent_title ;;
  }

  dimension: topic {
    description: "The CMS Lite topic."
    type: string
    sql: COALESCE(${TABLE}.topic, '(no topic)') ;;
    suggest_explore: themes_cache
    suggest_dimension: themes_cache.topic
  }

  dimension: topic_id {
    description: "The alphanumeric CMS Lite topic identifier."
    type: string
    sql: COALESCE(${TABLE}.topic_id,'') ;;
  }

  dimension: subtopic {
    description: "The CMS Lite subtopic."
    type: string
    sql: COALESCE(${TABLE}.subtopic, '(no subtopic)') ;;
    suggest_explore: themes_cache
    suggest_dimension: themes_cache.subtopic
  }

  dimension: subtopic_id {
    description: "The alphanumeric CMS Lite subtopic identifier."
    type: string
    sql: COALESCE(${TABLE}.subtopic_id,'') ;;
  }

  dimension: subsubtopic {
    description: "The CMS Lite subsubtopic."
    type: string
    sql: COALESCE(${TABLE}.subsubtopic, '(no subsubtopic)') ;;
    suggest_explore: themes_cache
    suggest_dimension: themes_cache.subsubtopic
  }

  dimension: subsubtopic_id {
    description: "The alphanumeric CMS Lite subsubtopic identifier."
    type: string
    sql: COALESCE(${TABLE}.subsubtopic_id,'') ;;
  }

  measure: count {
    type: count
    drill_fields: [subtheme_id, themes.subtheme_id, google_pdt.count, themes.count]
  }
}
