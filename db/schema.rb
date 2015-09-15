# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150915155415) do

  create_table "books", force: :cascade do |t|
    t.string   "author",         limit: 255
    t.string   "title",          limit: 255
    t.string   "isbn",           limit: 255
    t.string   "publisher",      limit: 255
    t.date     "date_published"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_bookcat_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_bookcat_users_on_reset_password_token", unique: true, using: :btree

  create_table "g2_AccessMap", id: false, force: :cascade do |t|
    t.integer "g_accessListId",  limit: 4, null: false
    t.integer "g_userOrGroupId", limit: 4, null: false
    t.integer "g_permission",    limit: 4, null: false
  end

  add_index "g2_AccessMap", ["g_accessListId"], name: "g2_AccessMap_83732", using: :btree
  add_index "g2_AccessMap", ["g_permission"], name: "g2_AccessMap_18058", using: :btree
  add_index "g2_AccessMap", ["g_userOrGroupId"], name: "g2_AccessMap_48775", using: :btree

  create_table "g2_AccessSubscriberMap", primary_key: "g_itemId", force: :cascade do |t|
    t.integer "g_accessListId", limit: 4, null: false
  end

  add_index "g2_AccessSubscriberMap", ["g_accessListId"], name: "g2_AccessSubscriberMap_83732", using: :btree

  create_table "g2_AlbumItem", primary_key: "g_id", force: :cascade do |t|
    t.string "g_theme",          limit: 32
    t.string "g_orderBy",        limit: 128
    t.string "g_orderDirection", limit: 32
  end

  create_table "g2_AnimationItem", primary_key: "g_id", force: :cascade do |t|
    t.integer "g_width",  limit: 4
    t.integer "g_height", limit: 4
  end

  create_table "g2_CacheMap", id: false, force: :cascade do |t|
    t.string  "g_key",       limit: 32,         null: false
    t.text    "g_value",     limit: 4294967295
    t.integer "g_userId",    limit: 4,          null: false
    t.integer "g_itemId",    limit: 4,          null: false
    t.string  "g_type",      limit: 32,         null: false
    t.integer "g_timestamp", limit: 4,          null: false
    t.integer "g_isEmpty",   limit: 4
  end

  add_index "g2_CacheMap", ["g_itemId"], name: "g2_CacheMap_75985", using: :btree
  add_index "g2_CacheMap", ["g_userId", "g_timestamp", "g_isEmpty"], name: "g2_CacheMap_21979", using: :btree

  create_table "g2_ChildEntity", primary_key: "g_id", force: :cascade do |t|
    t.integer "g_parentId", limit: 4, null: false
  end

  add_index "g2_ChildEntity", ["g_parentId"], name: "g2_ChildEntity_52718", using: :btree

  create_table "g2_Comment", primary_key: "g_id", force: :cascade do |t|
    t.integer "g_commenterId", limit: 4,     null: false
    t.string  "g_host",        limit: 128,   null: false
    t.string  "g_subject",     limit: 128
    t.text    "g_comment",     limit: 65535
    t.integer "g_date",        limit: 4,     null: false
    t.string  "g_author",      limit: 128
  end

  add_index "g2_Comment", ["g_date"], name: "g2_Comment_95610", using: :btree

  create_table "g2_DataItem", primary_key: "g_id", force: :cascade do |t|
    t.string  "g_mimeType", limit: 128
    t.integer "g_size",     limit: 4
  end

  create_table "g2_Derivative", primary_key: "g_id", force: :cascade do |t|
    t.integer "g_derivativeSourceId",   limit: 4,   null: false
    t.string  "g_derivativeOperations", limit: 255
    t.integer "g_derivativeOrder",      limit: 4,   null: false
    t.integer "g_derivativeSize",       limit: 4
    t.integer "g_derivativeType",       limit: 4,   null: false
    t.string  "g_mimeType",             limit: 128, null: false
    t.string  "g_postFilterOperations", limit: 255
    t.integer "g_isBroken",             limit: 4
  end

  add_index "g2_Derivative", ["g_derivativeOrder"], name: "g2_Derivative_25243", using: :btree
  add_index "g2_Derivative", ["g_derivativeSourceId"], name: "g2_Derivative_85338", using: :btree
  add_index "g2_Derivative", ["g_derivativeType"], name: "g2_Derivative_97216", using: :btree

  create_table "g2_DerivativeImage", primary_key: "g_id", force: :cascade do |t|
    t.integer "g_width",  limit: 4
    t.integer "g_height", limit: 4
  end

  create_table "g2_DerivativePrefsMap", id: false, force: :cascade do |t|
    t.integer "g_itemId",               limit: 4
    t.integer "g_order",                limit: 4
    t.integer "g_derivativeType",       limit: 4
    t.string  "g_derivativeOperations", limit: 255
  end

  add_index "g2_DerivativePrefsMap", ["g_itemId"], name: "g2_DerivativePrefsMap_75985", using: :btree

  create_table "g2_DescendentCountsMap", id: false, force: :cascade do |t|
    t.integer "g_userId",          limit: 4, null: false
    t.integer "g_itemId",          limit: 4, null: false
    t.integer "g_descendentCount", limit: 4, null: false
  end

  create_table "g2_Entity", primary_key: "g_id", force: :cascade do |t|
    t.integer "g_creationTimestamp",     limit: 4,   null: false
    t.integer "g_isLinkable",            limit: 4,   null: false
    t.integer "g_linkId",                limit: 4
    t.integer "g_modificationTimestamp", limit: 4,   null: false
    t.integer "g_serialNumber",          limit: 4,   null: false
    t.string  "g_entityType",            limit: 32,  null: false
    t.string  "g_onLoadHandlers",        limit: 128
  end

  add_index "g2_Entity", ["g_creationTimestamp"], name: "g2_Entity_76255", using: :btree
  add_index "g2_Entity", ["g_isLinkable"], name: "g2_Entity_35978", using: :btree
  add_index "g2_Entity", ["g_linkId"], name: "g2_Entity_44738", using: :btree
  add_index "g2_Entity", ["g_modificationTimestamp"], name: "g2_Entity_63025", using: :btree
  add_index "g2_Entity", ["g_serialNumber"], name: "g2_Entity_60702", using: :btree

  create_table "g2_ExifPropertiesMap", id: false, force: :cascade do |t|
    t.string  "g_property", limit: 128
    t.integer "g_viewMode", limit: 4
    t.integer "g_sequence", limit: 4
  end

  add_index "g2_ExifPropertiesMap", ["g_property", "g_viewMode"], name: "g_property", unique: true, using: :btree

  create_table "g2_ExternalIdMap", id: false, force: :cascade do |t|
    t.string  "g_externalId", limit: 128, null: false
    t.string  "g_entityType", limit: 32,  null: false
    t.integer "g_entityId",   limit: 4,   null: false
  end

  create_table "g2_FactoryMap", id: false, force: :cascade do |t|
    t.string "g_classType",    limit: 128
    t.string "g_className",    limit: 128
    t.string "g_implId",       limit: 128
    t.string "g_implPath",     limit: 128
    t.string "g_implModuleId", limit: 128
    t.string "g_hints",        limit: 255
    t.string "g_orderWeight",  limit: 255
  end

  create_table "g2_FailedLoginsMap", primary_key: "g_userName", force: :cascade do |t|
    t.integer "g_count",       limit: 4, null: false
    t.integer "g_lastAttempt", limit: 4, null: false
  end

  create_table "g2_FileSystemEntity", primary_key: "g_id", force: :cascade do |t|
    t.string "g_pathComponent", limit: 128
  end

  add_index "g2_FileSystemEntity", ["g_pathComponent"], name: "g2_FileSystemEntity_3406", using: :btree

  create_table "g2_Group", primary_key: "g_id", force: :cascade do |t|
    t.integer "g_groupType", limit: 4,   null: false
    t.string  "g_groupName", limit: 128
  end

  add_index "g2_Group", ["g_groupName"], name: "g_groupName", unique: true, using: :btree

  create_table "g2_Item", primary_key: "g_id", force: :cascade do |t|
    t.integer "g_canContainChildren",   limit: 4,     null: false
    t.text    "g_description",          limit: 65535
    t.string  "g_keywords",             limit: 255
    t.integer "g_ownerId",              limit: 4,     null: false
    t.string  "g_renderer",             limit: 128
    t.string  "g_summary",              limit: 255
    t.string  "g_title",                limit: 128
    t.integer "g_viewedSinceTimestamp", limit: 4,     null: false
    t.integer "g_originationTimestamp", limit: 4,     null: false
  end

  add_index "g2_Item", ["g_keywords"], name: "g2_Item_99070", using: :btree
  add_index "g2_Item", ["g_ownerId"], name: "g2_Item_21573", using: :btree
  add_index "g2_Item", ["g_summary"], name: "g2_Item_54147", using: :btree
  add_index "g2_Item", ["g_title"], name: "g2_Item_90059", using: :btree

  create_table "g2_ItemAttributesMap", primary_key: "g_itemId", force: :cascade do |t|
    t.integer "g_viewCount",      limit: 4
    t.integer "g_orderWeight",    limit: 4
    t.string  "g_parentSequence", limit: 255, null: false
  end

  add_index "g2_ItemAttributesMap", ["g_parentSequence"], name: "g2_ItemAttributesMap_95270", using: :btree

  create_table "g2_Lock", id: false, force: :cascade do |t|
    t.integer "g_lockId",        limit: 4
    t.integer "g_readEntityId",  limit: 4
    t.integer "g_writeEntityId", limit: 4
    t.integer "g_freshUntil",    limit: 4
    t.integer "g_request",       limit: 4
  end

  add_index "g2_Lock", ["g_lockId"], name: "g2_Lock_11039", using: :btree

  create_table "g2_MaintenanceMap", primary_key: "g_runId", force: :cascade do |t|
    t.string  "g_taskId",    limit: 128,   null: false
    t.integer "g_timestamp", limit: 4
    t.integer "g_success",   limit: 4
    t.text    "g_details",   limit: 65535
  end

  add_index "g2_MaintenanceMap", ["g_taskId"], name: "g2_MaintenanceMap_21687", using: :btree

  create_table "g2_MimeTypeMap", primary_key: "g_extension", force: :cascade do |t|
    t.string  "g_mimeType", limit: 32, null: false
    t.integer "g_viewable", limit: 4
  end

  create_table "g2_MovieItem", primary_key: "g_id", force: :cascade do |t|
    t.integer "g_width",    limit: 4
    t.integer "g_height",   limit: 4
    t.integer "g_duration", limit: 4
  end

  create_table "g2_PermissionSetMap", id: false, force: :cascade do |t|
    t.string  "g_module",      limit: 128, null: false
    t.string  "g_permission",  limit: 128, null: false
    t.string  "g_description", limit: 255
    t.integer "g_bits",        limit: 4,   null: false
    t.integer "g_flags",       limit: 4,   null: false
  end

  add_index "g2_PermissionSetMap", ["g_permission"], name: "g_permission", unique: true, using: :btree

  create_table "g2_PhotoItem", primary_key: "g_id", force: :cascade do |t|
    t.integer "g_width",  limit: 4
    t.integer "g_height", limit: 4
  end

  create_table "g2_PluginMap", id: false, force: :cascade do |t|
    t.string  "g_pluginType", limit: 32, null: false
    t.string  "g_pluginId",   limit: 32, null: false
    t.integer "g_active",     limit: 4,  null: false
  end

  create_table "g2_PluginPackageMap", id: false, force: :cascade do |t|
    t.string  "g_pluginType",     limit: 32, null: false
    t.string  "g_pluginId",       limit: 32, null: false
    t.string  "g_packageName",    limit: 32, null: false
    t.string  "g_packageVersion", limit: 32, null: false
    t.string  "g_packageBuild",   limit: 32, null: false
    t.integer "g_locked",         limit: 4,  null: false
  end

  add_index "g2_PluginPackageMap", ["g_pluginType"], name: "g2_PluginPackageMap_80596", using: :btree

  create_table "g2_PluginParameterMap", id: false, force: :cascade do |t|
    t.string  "g_pluginType",     limit: 32,    null: false
    t.string  "g_pluginId",       limit: 32,    null: false
    t.integer "g_itemId",         limit: 4,     null: false
    t.string  "g_parameterName",  limit: 128,   null: false
    t.text    "g_parameterValue", limit: 65535, null: false
  end

  add_index "g2_PluginParameterMap", ["g_pluginType", "g_pluginId", "g_itemId", "g_parameterName"], name: "g_pluginType", unique: true, using: :btree
  add_index "g2_PluginParameterMap", ["g_pluginType", "g_pluginId", "g_itemId"], name: "g2_PluginParameterMap_12808", using: :btree
  add_index "g2_PluginParameterMap", ["g_pluginType"], name: "g2_PluginParameterMap_80596", using: :btree

  create_table "g2_RatingCacheMap", primary_key: "g_itemId", force: :cascade do |t|
    t.integer "g_averageRating", limit: 4, null: false
    t.integer "g_voteCount",     limit: 4, null: false
  end

  create_table "g2_RatingMap", primary_key: "g_ratingId", force: :cascade do |t|
    t.integer "g_itemId",           limit: 4,   null: false
    t.integer "g_userId",           limit: 4,   null: false
    t.integer "g_rating",           limit: 4,   null: false
    t.string  "g_sessionId",        limit: 128
    t.string  "g_remoteIdentifier", limit: 255
  end

  add_index "g2_RatingMap", ["g_itemId", "g_remoteIdentifier"], name: "g2_RatingMap_2369", using: :btree
  add_index "g2_RatingMap", ["g_itemId", "g_userId"], name: "g2_RatingMap_80383", using: :btree
  add_index "g2_RatingMap", ["g_itemId"], name: "g2_RatingMap_75985", using: :btree

  create_table "g2_RecoverPasswordMap", primary_key: "g_userName", force: :cascade do |t|
    t.string  "g_authString",     limit: 32, null: false
    t.integer "g_requestExpires", limit: 4,  null: false
  end

  create_table "g2_Schema", primary_key: "g_name", force: :cascade do |t|
    t.integer "g_major",     limit: 4,     null: false
    t.integer "g_minor",     limit: 4,     null: false
    t.text    "g_createSql", limit: 65535
    t.string  "g_pluginId",  limit: 32
    t.string  "g_type",      limit: 32
    t.text    "g_info",      limit: 65535
  end

  create_table "g2_SequenceId", id: false, force: :cascade do |t|
    t.integer "id", limit: 4, null: false
  end

  create_table "g2_SequenceLock", id: false, force: :cascade do |t|
    t.integer "id", limit: 4, null: false
  end

  create_table "g2_SessionMap", primary_key: "g_id", force: :cascade do |t|
    t.integer "g_userId",                limit: 4,          null: false
    t.string  "g_remoteIdentifier",      limit: 128,        null: false
    t.integer "g_creationTimestamp",     limit: 4,          null: false
    t.integer "g_modificationTimestamp", limit: 4,          null: false
    t.text    "g_data",                  limit: 4294967295
  end

  add_index "g2_SessionMap", ["g_userId", "g_creationTimestamp", "g_modificationTimestamp"], name: "g2_SessionMap_53500", using: :btree

  create_table "g2_TkOperatnMap", primary_key: "g_name", force: :cascade do |t|
    t.string "g_parametersCrc",  limit: 32,  null: false
    t.string "g_outputMimeType", limit: 128
    t.string "g_description",    limit: 255
  end

  create_table "g2_TkOperatnMimeTypeMap", id: false, force: :cascade do |t|
    t.string  "g_operationName", limit: 128, null: false
    t.string  "g_toolkitId",     limit: 128, null: false
    t.string  "g_mimeType",      limit: 128, null: false
    t.integer "g_priority",      limit: 4,   null: false
  end

  add_index "g2_TkOperatnMimeTypeMap", ["g_mimeType"], name: "g2_TkOperatnMimeTypeMap_79463", using: :btree
  add_index "g2_TkOperatnMimeTypeMap", ["g_operationName"], name: "g2_TkOperatnMimeTypeMap_2014", using: :btree

  create_table "g2_TkOperatnParameterMap", id: false, force: :cascade do |t|
    t.string  "g_operationName", limit: 128, null: false
    t.integer "g_position",      limit: 4,   null: false
    t.string  "g_type",          limit: 128, null: false
    t.string  "g_description",   limit: 255
  end

  add_index "g2_TkOperatnParameterMap", ["g_operationName"], name: "g2_TkOperatnParameterMap_2014", using: :btree

  create_table "g2_TkPropertyMap", id: false, force: :cascade do |t|
    t.string "g_name",        limit: 128, null: false
    t.string "g_type",        limit: 128, null: false
    t.string "g_description", limit: 128, null: false
  end

  create_table "g2_TkPropertyMimeTypeMap", id: false, force: :cascade do |t|
    t.string "g_propertyName", limit: 128, null: false
    t.string "g_toolkitId",    limit: 128, null: false
    t.string "g_mimeType",     limit: 128, null: false
  end

  add_index "g2_TkPropertyMimeTypeMap", ["g_mimeType"], name: "g2_TkPropertyMimeTypeMap_79463", using: :btree
  add_index "g2_TkPropertyMimeTypeMap", ["g_propertyName"], name: "g2_TkPropertyMimeTypeMap_52881", using: :btree

  create_table "g2_UnknownItem", primary_key: "g_id", force: :cascade do |t|
  end

  create_table "g2_User", primary_key: "g_id", force: :cascade do |t|
    t.string  "g_userName",       limit: 32,              null: false
    t.string  "g_fullName",       limit: 128
    t.string  "g_hashedPassword", limit: 128
    t.string  "g_email",          limit: 255
    t.string  "g_language",       limit: 128
    t.integer "g_locked",         limit: 4,   default: 0
  end

  add_index "g2_User", ["g_userName"], name: "g_userName", unique: true, using: :btree

  create_table "g2_UserGroupMap", id: false, force: :cascade do |t|
    t.integer "g_userId",  limit: 4, null: false
    t.integer "g_groupId", limit: 4, null: false
  end

  add_index "g2_UserGroupMap", ["g_groupId"], name: "g2_UserGroupMap_89328", using: :btree
  add_index "g2_UserGroupMap", ["g_userId"], name: "g2_UserGroupMap_69068", using: :btree

  create_table "wp_commentmeta", primary_key: "meta_id", force: :cascade do |t|
    t.integer "comment_id", limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wp_commentmeta", ["comment_id"], name: "comment_id", using: :btree
  add_index "wp_commentmeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree

  create_table "wp_comments", primary_key: "comment_ID", force: :cascade do |t|
    t.integer  "comment_post_ID",      limit: 8,     default: 0,   null: false
    t.text     "comment_author",       limit: 255,                 null: false
    t.string   "comment_author_email", limit: 100,   default: "",  null: false
    t.string   "comment_author_url",   limit: 200,   default: "",  null: false
    t.string   "comment_author_IP",    limit: 100,   default: "",  null: false
    t.datetime "comment_date",                                     null: false
    t.datetime "comment_date_gmt",                                 null: false
    t.text     "comment_content",      limit: 65535,               null: false
    t.integer  "comment_karma",        limit: 4,     default: 0,   null: false
    t.string   "comment_approved",     limit: 20,    default: "1", null: false
    t.string   "comment_agent",        limit: 255,   default: "",  null: false
    t.string   "comment_type",         limit: 20,    default: "",  null: false
    t.integer  "comment_parent",       limit: 8,     default: 0,   null: false
    t.integer  "user_id",              limit: 8,     default: 0,   null: false
  end

  add_index "wp_comments", ["comment_approved", "comment_date_gmt"], name: "comment_approved_date_gmt", using: :btree
  add_index "wp_comments", ["comment_author_email"], name: "comment_author_email", length: {"comment_author_email"=>10}, using: :btree
  add_index "wp_comments", ["comment_date_gmt"], name: "comment_date_gmt", using: :btree
  add_index "wp_comments", ["comment_parent"], name: "comment_parent", using: :btree
  add_index "wp_comments", ["comment_post_ID"], name: "comment_post_ID", using: :btree

  create_table "wp_links", primary_key: "link_id", force: :cascade do |t|
    t.string   "link_url",         limit: 255,      default: "",  null: false
    t.string   "link_name",        limit: 255,      default: "",  null: false
    t.string   "link_image",       limit: 255,      default: "",  null: false
    t.string   "link_target",      limit: 25,       default: "",  null: false
    t.integer  "link_category",    limit: 8,        default: 0,   null: false
    t.string   "link_description", limit: 255,      default: "",  null: false
    t.string   "link_visible",     limit: 20,       default: "Y", null: false
    t.integer  "link_owner",       limit: 8,        default: 1,   null: false
    t.integer  "link_rating",      limit: 4,        default: 0,   null: false
    t.datetime "link_updated",                                    null: false
    t.string   "link_rel",         limit: 255,      default: "",  null: false
    t.text     "link_notes",       limit: 16777215,               null: false
    t.string   "link_rss",         limit: 255,      default: "",  null: false
  end

  add_index "wp_links", ["link_category"], name: "link_category", using: :btree
  add_index "wp_links", ["link_visible"], name: "link_visible", using: :btree

  create_table "wp_openid_identities", primary_key: "uurl_id", force: :cascade do |t|
    t.integer "user_id", limit: 8,     default: 0, null: false
    t.text    "url",     limit: 65535
    t.string  "hash",    limit: 32
  end

  add_index "wp_openid_identities", ["hash"], name: "uurl", unique: true, using: :btree
  add_index "wp_openid_identities", ["url"], name: "url", length: {"url"=>30}, using: :btree
  add_index "wp_openid_identities", ["user_id"], name: "user_id", using: :btree

  create_table "wp_options", primary_key: "option_id", force: :cascade do |t|
    t.string "option_name",  limit: 64,         default: "",    null: false
    t.text   "option_value", limit: 4294967295,                 null: false
    t.string "autoload",     limit: 20,         default: "yes", null: false
  end

  add_index "wp_options", ["option_name"], name: "option_name", unique: true, using: :btree

  create_table "wp_postmeta", primary_key: "meta_id", force: :cascade do |t|
    t.integer "post_id",    limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wp_postmeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree
  add_index "wp_postmeta", ["post_id"], name: "post_id", using: :btree

  create_table "wp_posts", primary_key: "ID", force: :cascade do |t|
    t.integer  "post_author",           limit: 8,          default: 0,         null: false
    t.datetime "post_date",                                                    null: false
    t.datetime "post_date_gmt",                                                null: false
    t.text     "post_content",          limit: 4294967295,                     null: false
    t.text     "post_title",            limit: 65535,                          null: false
    t.integer  "post_category",         limit: 4,          default: 0,         null: false
    t.text     "post_excerpt",          limit: 65535,                          null: false
    t.string   "post_status",           limit: 20,         default: "publish", null: false
    t.string   "comment_status",        limit: 20,         default: "open",    null: false
    t.string   "ping_status",           limit: 20,         default: "open",    null: false
    t.string   "post_password",         limit: 20,         default: "",        null: false
    t.string   "post_name",             limit: 200,        default: "",        null: false
    t.text     "to_ping",               limit: 65535,                          null: false
    t.text     "pinged",                limit: 65535,                          null: false
    t.datetime "post_modified",                                                null: false
    t.datetime "post_modified_gmt",                                            null: false
    t.text     "post_content_filtered", limit: 4294967295,                     null: false
    t.integer  "post_parent",           limit: 8,          default: 0,         null: false
    t.string   "guid",                  limit: 255,        default: "",        null: false
    t.integer  "menu_order",            limit: 4,          default: 0,         null: false
    t.string   "post_type",             limit: 20,         default: "post",    null: false
    t.string   "post_mime_type",        limit: 100,        default: "",        null: false
    t.integer  "comment_count",         limit: 8,          default: 0,         null: false
  end

  add_index "wp_posts", ["post_author"], name: "post_author", using: :btree
  add_index "wp_posts", ["post_name"], name: "post_name", length: {"post_name"=>191}, using: :btree
  add_index "wp_posts", ["post_parent"], name: "post_parent", using: :btree
  add_index "wp_posts", ["post_type", "post_status", "post_date", "ID"], name: "type_status_date", using: :btree

  create_table "wp_term_relationships", id: false, force: :cascade do |t|
    t.integer "object_id",        limit: 8, default: 0, null: false
    t.integer "term_taxonomy_id", limit: 8, default: 0, null: false
    t.integer "term_order",       limit: 4, default: 0, null: false
  end

  add_index "wp_term_relationships", ["term_taxonomy_id"], name: "term_taxonomy_id", using: :btree

  create_table "wp_term_taxonomy", primary_key: "term_taxonomy_id", force: :cascade do |t|
    t.integer "term_id",     limit: 8,          default: 0,  null: false
    t.string  "taxonomy",    limit: 32,         default: "", null: false
    t.text    "description", limit: 4294967295,              null: false
    t.integer "parent",      limit: 8,          default: 0,  null: false
    t.integer "count",       limit: 8,          default: 0,  null: false
  end

  add_index "wp_term_taxonomy", ["taxonomy"], name: "taxonomy", using: :btree
  add_index "wp_term_taxonomy", ["term_id", "taxonomy"], name: "term_id_taxonomy", unique: true, using: :btree

  create_table "wp_terms", primary_key: "term_id", force: :cascade do |t|
    t.string  "name",       limit: 200, default: "", null: false
    t.string  "slug",       limit: 200, default: "", null: false
    t.integer "term_group", limit: 8,   default: 0,  null: false
  end

  add_index "wp_terms", ["name"], name: "name", length: {"name"=>191}, using: :btree
  add_index "wp_terms", ["slug"], name: "slug", length: {"slug"=>191}, using: :btree

  create_table "wp_usermeta", primary_key: "umeta_id", force: :cascade do |t|
    t.integer "user_id",    limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wp_usermeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree
  add_index "wp_usermeta", ["user_id"], name: "user_id", using: :btree

  create_table "wp_users", primary_key: "ID", force: :cascade do |t|
    t.string   "user_login",          limit: 60,  default: "", null: false
    t.string   "user_pass",           limit: 64,  default: "", null: false
    t.string   "user_nicename",       limit: 50,  default: "", null: false
    t.string   "user_email",          limit: 100, default: "", null: false
    t.string   "user_url",            limit: 100, default: "", null: false
    t.datetime "user_registered",                              null: false
    t.string   "user_activation_key", limit: 60,  default: "", null: false
    t.integer  "user_status",         limit: 4,   default: 0,  null: false
    t.string   "display_name",        limit: 250, default: "", null: false
  end

  add_index "wp_users", ["user_login"], name: "user_login_key", using: :btree
  add_index "wp_users", ["user_nicename"], name: "user_nicename", using: :btree

  create_table "wpj_commentmeta", primary_key: "meta_id", force: :cascade do |t|
    t.integer "comment_id", limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wpj_commentmeta", ["comment_id"], name: "comment_id", using: :btree
  add_index "wpj_commentmeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree

  create_table "wpj_comments", primary_key: "comment_ID", force: :cascade do |t|
    t.integer  "comment_post_ID",      limit: 8,     default: 0,   null: false
    t.text     "comment_author",       limit: 255,                 null: false
    t.string   "comment_author_email", limit: 100,   default: "",  null: false
    t.string   "comment_author_url",   limit: 200,   default: "",  null: false
    t.string   "comment_author_IP",    limit: 100,   default: "",  null: false
    t.datetime "comment_date",                                     null: false
    t.datetime "comment_date_gmt",                                 null: false
    t.text     "comment_content",      limit: 65535,               null: false
    t.integer  "comment_karma",        limit: 4,     default: 0,   null: false
    t.string   "comment_approved",     limit: 20,    default: "1", null: false
    t.string   "comment_agent",        limit: 255,   default: "",  null: false
    t.string   "comment_type",         limit: 20,    default: "",  null: false
    t.integer  "comment_parent",       limit: 8,     default: 0,   null: false
    t.integer  "user_id",              limit: 8,     default: 0,   null: false
  end

  add_index "wpj_comments", ["comment_approved", "comment_date_gmt"], name: "comment_approved_date_gmt", using: :btree
  add_index "wpj_comments", ["comment_author_email"], name: "comment_author_email", length: {"comment_author_email"=>10}, using: :btree
  add_index "wpj_comments", ["comment_date_gmt"], name: "comment_date_gmt", using: :btree
  add_index "wpj_comments", ["comment_parent"], name: "comment_parent", using: :btree
  add_index "wpj_comments", ["comment_post_ID"], name: "comment_post_ID", using: :btree

  create_table "wpj_links", primary_key: "link_id", force: :cascade do |t|
    t.string   "link_url",         limit: 255,      default: "",  null: false
    t.string   "link_name",        limit: 255,      default: "",  null: false
    t.string   "link_image",       limit: 255,      default: "",  null: false
    t.string   "link_target",      limit: 25,       default: "",  null: false
    t.string   "link_description", limit: 255,      default: "",  null: false
    t.string   "link_visible",     limit: 20,       default: "Y", null: false
    t.integer  "link_owner",       limit: 8,        default: 1,   null: false
    t.integer  "link_rating",      limit: 4,        default: 0,   null: false
    t.datetime "link_updated",                                    null: false
    t.string   "link_rel",         limit: 255,      default: "",  null: false
    t.text     "link_notes",       limit: 16777215,               null: false
    t.string   "link_rss",         limit: 255,      default: "",  null: false
  end

  add_index "wpj_links", ["link_visible"], name: "link_visible", using: :btree

  create_table "wpj_options", primary_key: "option_id", force: :cascade do |t|
    t.string "option_name",  limit: 64,         default: "",    null: false
    t.text   "option_value", limit: 4294967295,                 null: false
    t.string "autoload",     limit: 20,         default: "yes", null: false
  end

  add_index "wpj_options", ["option_name"], name: "option_name", unique: true, using: :btree

  create_table "wpj_postmeta", primary_key: "meta_id", force: :cascade do |t|
    t.integer "post_id",    limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wpj_postmeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree
  add_index "wpj_postmeta", ["post_id"], name: "post_id", using: :btree

  create_table "wpj_posts", primary_key: "ID", force: :cascade do |t|
    t.integer  "post_author",           limit: 8,          default: 0,         null: false
    t.datetime "post_date",                                                    null: false
    t.datetime "post_date_gmt",                                                null: false
    t.text     "post_content",          limit: 4294967295,                     null: false
    t.text     "post_title",            limit: 65535,                          null: false
    t.text     "post_excerpt",          limit: 65535,                          null: false
    t.string   "post_status",           limit: 20,         default: "publish", null: false
    t.string   "comment_status",        limit: 20,         default: "open",    null: false
    t.string   "ping_status",           limit: 20,         default: "open",    null: false
    t.string   "post_password",         limit: 20,         default: "",        null: false
    t.string   "post_name",             limit: 200,        default: "",        null: false
    t.text     "to_ping",               limit: 65535,                          null: false
    t.text     "pinged",                limit: 65535,                          null: false
    t.datetime "post_modified",                                                null: false
    t.datetime "post_modified_gmt",                                            null: false
    t.text     "post_content_filtered", limit: 4294967295,                     null: false
    t.integer  "post_parent",           limit: 8,          default: 0,         null: false
    t.string   "guid",                  limit: 255,        default: "",        null: false
    t.integer  "menu_order",            limit: 4,          default: 0,         null: false
    t.string   "post_type",             limit: 20,         default: "post",    null: false
    t.string   "post_mime_type",        limit: 100,        default: "",        null: false
    t.integer  "comment_count",         limit: 8,          default: 0,         null: false
  end

  add_index "wpj_posts", ["post_author"], name: "post_author", using: :btree
  add_index "wpj_posts", ["post_name"], name: "post_name", length: {"post_name"=>191}, using: :btree
  add_index "wpj_posts", ["post_parent"], name: "post_parent", using: :btree
  add_index "wpj_posts", ["post_type", "post_status", "post_date", "ID"], name: "type_status_date", using: :btree

  create_table "wpj_term_relationships", id: false, force: :cascade do |t|
    t.integer "object_id",        limit: 8, default: 0, null: false
    t.integer "term_taxonomy_id", limit: 8, default: 0, null: false
    t.integer "term_order",       limit: 4, default: 0, null: false
  end

  add_index "wpj_term_relationships", ["term_taxonomy_id"], name: "term_taxonomy_id", using: :btree

  create_table "wpj_term_taxonomy", primary_key: "term_taxonomy_id", force: :cascade do |t|
    t.integer "term_id",     limit: 8,          default: 0,  null: false
    t.string  "taxonomy",    limit: 32,         default: "", null: false
    t.text    "description", limit: 4294967295,              null: false
    t.integer "parent",      limit: 8,          default: 0,  null: false
    t.integer "count",       limit: 8,          default: 0,  null: false
  end

  add_index "wpj_term_taxonomy", ["taxonomy"], name: "taxonomy", using: :btree
  add_index "wpj_term_taxonomy", ["term_id", "taxonomy"], name: "term_id_taxonomy", unique: true, using: :btree

  create_table "wpj_terms", primary_key: "term_id", force: :cascade do |t|
    t.string  "name",       limit: 200, default: "", null: false
    t.string  "slug",       limit: 200, default: "", null: false
    t.integer "term_group", limit: 8,   default: 0,  null: false
  end

  add_index "wpj_terms", ["name"], name: "name", length: {"name"=>191}, using: :btree
  add_index "wpj_terms", ["slug"], name: "slug", length: {"slug"=>191}, using: :btree

  create_table "wpj_usermeta", primary_key: "umeta_id", force: :cascade do |t|
    t.integer "user_id",    limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wpj_usermeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree
  add_index "wpj_usermeta", ["user_id"], name: "user_id", using: :btree

  create_table "wpj_users", primary_key: "ID", force: :cascade do |t|
    t.string   "user_login",          limit: 60,  default: "", null: false
    t.string   "user_pass",           limit: 64,  default: "", null: false
    t.string   "user_nicename",       limit: 50,  default: "", null: false
    t.string   "user_email",          limit: 100, default: "", null: false
    t.string   "user_url",            limit: 100, default: "", null: false
    t.datetime "user_registered",                              null: false
    t.string   "user_activation_key", limit: 60,  default: "", null: false
    t.integer  "user_status",         limit: 4,   default: 0,  null: false
    t.string   "display_name",        limit: 250, default: "", null: false
  end

  add_index "wpj_users", ["user_login"], name: "user_login_key", using: :btree
  add_index "wpj_users", ["user_nicename"], name: "user_nicename", using: :btree

  create_table "wpnh_commentmeta", primary_key: "meta_id", force: :cascade do |t|
    t.integer "comment_id", limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wpnh_commentmeta", ["comment_id"], name: "comment_id", using: :btree
  add_index "wpnh_commentmeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree

  create_table "wpnh_comments", primary_key: "comment_ID", force: :cascade do |t|
    t.integer  "comment_post_ID",      limit: 8,     default: 0,   null: false
    t.text     "comment_author",       limit: 255,                 null: false
    t.string   "comment_author_email", limit: 100,   default: "",  null: false
    t.string   "comment_author_url",   limit: 200,   default: "",  null: false
    t.string   "comment_author_IP",    limit: 100,   default: "",  null: false
    t.datetime "comment_date",                                     null: false
    t.datetime "comment_date_gmt",                                 null: false
    t.text     "comment_content",      limit: 65535,               null: false
    t.integer  "comment_karma",        limit: 4,     default: 0,   null: false
    t.string   "comment_approved",     limit: 20,    default: "1", null: false
    t.string   "comment_agent",        limit: 255,   default: "",  null: false
    t.string   "comment_type",         limit: 20,    default: "",  null: false
    t.integer  "comment_parent",       limit: 8,     default: 0,   null: false
    t.integer  "user_id",              limit: 8,     default: 0,   null: false
  end

  add_index "wpnh_comments", ["comment_approved", "comment_date_gmt"], name: "comment_approved_date_gmt", using: :btree
  add_index "wpnh_comments", ["comment_author_email"], name: "comment_author_email", length: {"comment_author_email"=>10}, using: :btree
  add_index "wpnh_comments", ["comment_date_gmt"], name: "comment_date_gmt", using: :btree
  add_index "wpnh_comments", ["comment_parent"], name: "comment_parent", using: :btree
  add_index "wpnh_comments", ["comment_post_ID"], name: "comment_post_ID", using: :btree

  create_table "wpnh_links", primary_key: "link_id", force: :cascade do |t|
    t.string   "link_url",         limit: 255,      default: "",  null: false
    t.string   "link_name",        limit: 255,      default: "",  null: false
    t.string   "link_image",       limit: 255,      default: "",  null: false
    t.string   "link_target",      limit: 25,       default: "",  null: false
    t.string   "link_description", limit: 255,      default: "",  null: false
    t.string   "link_visible",     limit: 20,       default: "Y", null: false
    t.integer  "link_owner",       limit: 8,        default: 1,   null: false
    t.integer  "link_rating",      limit: 4,        default: 0,   null: false
    t.datetime "link_updated",                                    null: false
    t.string   "link_rel",         limit: 255,      default: "",  null: false
    t.text     "link_notes",       limit: 16777215,               null: false
    t.string   "link_rss",         limit: 255,      default: "",  null: false
  end

  add_index "wpnh_links", ["link_visible"], name: "link_visible", using: :btree

  create_table "wpnh_options", primary_key: "option_id", force: :cascade do |t|
    t.string "option_name",  limit: 64,         default: "",    null: false
    t.text   "option_value", limit: 4294967295,                 null: false
    t.string "autoload",     limit: 20,         default: "yes", null: false
  end

  add_index "wpnh_options", ["option_name"], name: "option_name", unique: true, using: :btree

  create_table "wpnh_postmeta", primary_key: "meta_id", force: :cascade do |t|
    t.integer "post_id",    limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wpnh_postmeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree
  add_index "wpnh_postmeta", ["post_id"], name: "post_id", using: :btree

  create_table "wpnh_posts", primary_key: "ID", force: :cascade do |t|
    t.integer  "post_author",           limit: 8,          default: 0,         null: false
    t.datetime "post_date",                                                    null: false
    t.datetime "post_date_gmt",                                                null: false
    t.text     "post_content",          limit: 4294967295,                     null: false
    t.text     "post_title",            limit: 65535,                          null: false
    t.text     "post_excerpt",          limit: 65535,                          null: false
    t.string   "post_status",           limit: 20,         default: "publish", null: false
    t.string   "comment_status",        limit: 20,         default: "open",    null: false
    t.string   "ping_status",           limit: 20,         default: "open",    null: false
    t.string   "post_password",         limit: 20,         default: "",        null: false
    t.string   "post_name",             limit: 200,        default: "",        null: false
    t.text     "to_ping",               limit: 65535,                          null: false
    t.text     "pinged",                limit: 65535,                          null: false
    t.datetime "post_modified",                                                null: false
    t.datetime "post_modified_gmt",                                            null: false
    t.text     "post_content_filtered", limit: 4294967295,                     null: false
    t.integer  "post_parent",           limit: 8,          default: 0,         null: false
    t.string   "guid",                  limit: 255,        default: "",        null: false
    t.integer  "menu_order",            limit: 4,          default: 0,         null: false
    t.string   "post_type",             limit: 20,         default: "post",    null: false
    t.string   "post_mime_type",        limit: 100,        default: "",        null: false
    t.integer  "comment_count",         limit: 8,          default: 0,         null: false
  end

  add_index "wpnh_posts", ["post_author"], name: "post_author", using: :btree
  add_index "wpnh_posts", ["post_name"], name: "post_name", length: {"post_name"=>191}, using: :btree
  add_index "wpnh_posts", ["post_parent"], name: "post_parent", using: :btree
  add_index "wpnh_posts", ["post_type", "post_status", "post_date", "ID"], name: "type_status_date", using: :btree

  create_table "wpnh_term_relationships", id: false, force: :cascade do |t|
    t.integer "object_id",        limit: 8, default: 0, null: false
    t.integer "term_taxonomy_id", limit: 8, default: 0, null: false
    t.integer "term_order",       limit: 4, default: 0, null: false
  end

  add_index "wpnh_term_relationships", ["term_taxonomy_id"], name: "term_taxonomy_id", using: :btree

  create_table "wpnh_term_taxonomy", primary_key: "term_taxonomy_id", force: :cascade do |t|
    t.integer "term_id",     limit: 8,          default: 0,  null: false
    t.string  "taxonomy",    limit: 32,         default: "", null: false
    t.text    "description", limit: 4294967295,              null: false
    t.integer "parent",      limit: 8,          default: 0,  null: false
    t.integer "count",       limit: 8,          default: 0,  null: false
  end

  add_index "wpnh_term_taxonomy", ["taxonomy"], name: "taxonomy", using: :btree
  add_index "wpnh_term_taxonomy", ["term_id", "taxonomy"], name: "term_id_taxonomy", unique: true, using: :btree

  create_table "wpnh_terms", primary_key: "term_id", force: :cascade do |t|
    t.string  "name",       limit: 200, default: "", null: false
    t.string  "slug",       limit: 200, default: "", null: false
    t.integer "term_group", limit: 8,   default: 0,  null: false
  end

  add_index "wpnh_terms", ["name"], name: "name", length: {"name"=>191}, using: :btree
  add_index "wpnh_terms", ["slug"], name: "slug", length: {"slug"=>191}, using: :btree

  create_table "wpnh_usermeta", primary_key: "umeta_id", force: :cascade do |t|
    t.integer "user_id",    limit: 8,          default: 0, null: false
    t.string  "meta_key",   limit: 255
    t.text    "meta_value", limit: 4294967295
  end

  add_index "wpnh_usermeta", ["meta_key"], name: "meta_key", length: {"meta_key"=>191}, using: :btree
  add_index "wpnh_usermeta", ["user_id"], name: "user_id", using: :btree

  create_table "wpnh_users", primary_key: "ID", force: :cascade do |t|
    t.string   "user_login",          limit: 60,  default: "", null: false
    t.string   "user_pass",           limit: 64,  default: "", null: false
    t.string   "user_nicename",       limit: 50,  default: "", null: false
    t.string   "user_email",          limit: 100, default: "", null: false
    t.string   "user_url",            limit: 100, default: "", null: false
    t.datetime "user_registered",                              null: false
    t.string   "user_activation_key", limit: 60,  default: "", null: false
    t.integer  "user_status",         limit: 4,   default: 0,  null: false
    t.string   "display_name",        limit: 250, default: "", null: false
  end

  add_index "wpnh_users", ["user_login"], name: "user_login_key", using: :btree
  add_index "wpnh_users", ["user_nicename"], name: "user_nicename", using: :btree

end
