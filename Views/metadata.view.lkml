view: metadata {
  sql_table_name: cmslite.metadata ;;

  dimension: ancestor_nodes {
    type: string
    sql: ${TABLE}.ancestor_nodes ;;
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: dcterms_creator {
    type: string
    sql: ${TABLE}.dcterms_creator ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: eng_nav_title {
    type: string
    sql: ${TABLE}.eng_nav_title ;;
  }

  dimension: hr_url {
    type: string
    sql: ${TABLE}.hr_url ;;
  }

  dimension: keywords {
    type: string
    sql: ${TABLE}.keywords ;;
  }

  dimension: language_code {
    type: string
    sql: ${TABLE}.language_code ;;
  }

  dimension: language_name {
    type: string
    sql: ${TABLE}.language_name ;;
  }

  dimension_group: modified {
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
    sql: ${TABLE}.modified_date ;;
  }

  dimension: nav_title {
    type: string
    sql: ${TABLE}.nav_title ;;
  }

  dimension: node_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.node_id ;;
  }

  dimension: page_type {
    type: string
    sql: ${TABLE}.page_type ;;
  }

  dimension: parent_node_id {
    type: string
    sql: ${TABLE}.parent_node_id ;;
  }

  dimension_group: published {
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
    sql: ${TABLE}.published_date ;;
  }

  dimension: site_id {
    type: string
    sql: ${TABLE}.site_id ;;
  }

  dimension: sitekey {
    type: string
    sql: ${TABLE}.sitekey ;;
  }

  dimension: synonyms {
    type: string
    sql: ${TABLE}.synonyms ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_date ;;
  }

  dimension: page_status {
    type: string
    sql: ${TABLE}.page_status ;;
  }

  dimension: published_by {
    type: string
    sql: ${TABLE}.published_by ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: modified_by {
    type: string
    sql: ${TABLE}.modified_by ;;
  }

  dimension: node_level {
    type: string
    sql: ${TABLE}.node_level ;;
  }

  dimension_group: locked {
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
    sql: ${TABLE}.locked_date ;;
  }

  dimension_group: moved {
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
    sql: ${TABLE}.moved_date ;;
  }

  dimension: exclude_from_ia {
    type: string
    sql: ${TABLE}.exclude_from_ia ;;
  }

  dimension: hide_from_navigation {
    type: string
    sql: ${TABLE}.hide_from_navigation ;;
  }

  dimension: exclude_from_search_engines {
    type: string
    sql: ${TABLE}.exclude_from_search_engines ;;
  }

  dimension: security_classification {
    type: string
    sql: ${TABLE}.security_classification ;;
  }

  dimension: security_label {
    type: string
    sql: ${TABLE}.security_label ;;
  }

  dimension_group: publication {
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
    sql: ${TABLE}.publication_date ;;
  }

  dimension: defined_security_groups {
    type: string
    sql: ${TABLE}.defined_security_groups ;;
  }

  dimension: inherited_security_groups {
    type: string
    sql: ${TABLE}.inherited_security_groups ;;
  }

  dimension: asset_folder {
    description: "Dev version of asset folders for FOI work"
    type: string
    sql: CASE
      WHEN ${parent_node_id} = '5CAE76ADAE994DC8B60212BA6DF22ED0' THEN 'Open Government'
      WHEN ${parent_node_id} = '7C24ACD5C5E54395877764D1D6278D12' THEN 'Open Information'
      WHEN ${parent_node_id} = '0AC4388189F44A4C962D526F80940BE3' THEN 'Alternative Service Delivery Contracts'
      WHEN ${parent_node_id} = '298AD3F178704B8F84020CE3F44217E8' THEN 'Archive'
      WHEN ${parent_node_id} = '455436B6ED734A9FA3987A12492E0AA2' THEN 'Calendars'
      WHEN ${parent_node_id} = '1AA5208799524175BB2248D63154F74C' THEN 'Directly_Awarded_Contracts'
      WHEN ${parent_node_id} = 'E005949023DE4ED28729F906352F9593' THEN 'Jan_2018_calendars'
      WHEN ${parent_node_id} = 'CA5A6D0BE40C4E0DBD28B9F852FD8C1D' THEN 'pattern library'
      ELSE NULL
      END ;;
  }

  measure: count {
    type: count
    drill_fields: [title]
  }
}
