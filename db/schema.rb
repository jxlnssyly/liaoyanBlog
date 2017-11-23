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

ActiveRecord::Schema.define(version: 20170720012646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "keyword", default: ""
    t.text "content"
    t.string "name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_group", id: :serial, force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.index "name varchar_pattern_ops", name: "auth_group_name_253ae2a6331666e8_like"
    t.index ["name"], name: "auth_group_name_key", unique: true
  end

  create_table "auth_group_permissions", id: :serial, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_key", unique: true
    t.index ["group_id"], name: "auth_group_permissions_0e939a4f"
    t.index ["permission_id"], name: "auth_group_permissions_8373b171"
  end

  create_table "auth_permission", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_key", unique: true
    t.index ["content_type_id"], name: "auth_permission_417f1b1c"
  end

  create_table "auth_user", id: :serial, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.datetime "last_login"
    t.boolean "is_superuser", null: false
    t.string "username", limit: 150, null: false
    t.string "first_name", limit: 30, null: false
    t.string "last_name", limit: 30, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.datetime "date_joined", null: false
    t.index "username varchar_pattern_ops", name: "auth_user_username_51b3b110094b8aae_like"
    t.index ["username"], name: "auth_user_username_key", unique: true
  end

  create_table "auth_user_groups", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_0e939a4f"
    t.index ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_key", unique: true
    t.index ["user_id"], name: "auth_user_groups_e8701ad4"
  end

  create_table "auth_user_user_permissions", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "auth_user_user_permissions_8373b171"
    t.index ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_key", unique: true
    t.index ["user_id"], name: "auth_user_user_permissions_e8701ad4"
  end

  create_table "django_admin_log", id: :serial, force: :cascade do |t|
    t.datetime "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.integer "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_417f1b1c"
    t.index ["user_id"], name: "django_admin_log_e8701ad4"
  end

  create_table "django_content_type", id: :serial, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_45f3b1d93ec8c61c_uniq", unique: true
  end

  create_table "django_migrations", id: :serial, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.datetime "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: :string, limit: 40, force: :cascade do |t|
    t.text "session_data", null: false
    t.datetime "expire_date", null: false
    t.index "session_key varchar_pattern_ops", name: "django_session_session_key_461cfeaa630ca218_like"
    t.index ["expire_date"], name: "django_session_de54fa62"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "src"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "restaurant"
    t.integer "star"
    t.integer "average_price"
    t.string "foodtype"
    t.string "addr"
    t.float "taste"
    t.float "environment"
    t.float "service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["average_price"], name: "index_foods_on_average_price"
    t.index ["foodtype"], name: "index_foods_on_foodtype"
    t.index ["restaurant", "addr"], name: "index_foods_on_restaurant_and_addr", unique: true
    t.index ["star"], name: "index_foods_on_star"
  end

  create_table "imageload_photo", id: :serial, force: :cascade do |t|
    t.string "title", limit: 20, null: false
    t.string "type", limit: 255, null: false
    t.boolean "advertisement", null: false
  end

  create_table "imageload_propertyimage", id: :serial, force: :cascade do |t|
    t.string "image", limit: 100, null: false
    t.integer "property_id", null: false
    t.index ["property_id"], name: "imageload_propertyimage_6bb837ff"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_content_type_id_508cf46651277a81_fk_django_content_type_id"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id"
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id"
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "djan_content_type_id_697914295151027a_fk_django_content_type_id"
  add_foreign_key "imageload_propertyimage", "imageload_photo", column: "property_id", name: "imageload_pr_property_id_77413cc05b8bebea_fk_imageload_photo_id"
end
