# The connection will be defined in the destination project
connection: "redshift_pacific_time"

# include all the views
include: "/Views/**/*.view"

# include themes_cache explore
include: "/Explores/themes_cache.explore.lkml"


explore: cmslite_users {
  persist_for: "24 hours"

  join: published {
    from: metadata
    type: left_outer
    relationship: one_to_many
    sql_on: CONCAT('IDIR', ${cmslite_users.user_idir}) = ${published.published_by} ;;
  }

  join: created {
    from: metadata
    type: left_outer
    relationship: one_to_many
    sql_on: CONCAT('IDIR', ${cmslite_users.user_idir}) = ${created.created_by} ;;
  }

  join: modified {
    from: metadata
    type: left_outer
    relationship: one_to_many
    sql_on: CONCAT('IDIR', ${cmslite_users.user_idir}) = ${modified.modified_by} ;;
  }

  join: group_membership {
    type:  left_outer
    sql_on: ${cmslite_users.id} = ${group_membership.user_id} ;;
    relationship: one_to_one
  }

  join: user_activity {
    type: inner
    sql_on:  ${cmslite_users.user_idir} = ${user_activity.user_idir};;
    relationship: one_to_one
  }
}

explore: cmslite_groups {
  persist_for: "24 hours"

  join: group_membership {
    type:  left_outer
    sql_on: ${cmslite_groups.id} = ${group_membership.group_id} ;;
    relationship: one_to_one
  }

  join: user_activity {
    type:  left_outer
    sql_on:  ${group_membership.group_name} = ${user_activity.group_name} and ${group_membership.user_id} = ${user_activity.user_id};;
    relationship: many_to_one
  }

  join: cmslite_users {
    type: left_outer
    sql_on:   ${user_activity.user_id} = ${cmslite_users.id};;
    relationship: one_to_one
  }
}

explore: audiences {}

explore: content_types {}

explore: creators {}

explore: dcterms_languages {}

explore: dcterms_subjects {}

explore: mbcterms_subject_categories {}

explore: metadata {}

explore: metadata_audiences {}

explore: metadata_content_types {}

explore: metadata_creators {}

explore: metadata_languages {}

explore: metadata_subject_categories {}

explore: metadata_subjects {}

explore: microservice_log {}

explore: themes {}
