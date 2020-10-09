# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_09_080703) do

  create_table "caregivers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "degree_id", null: false
    t.integer "cognition_id", null: false
    t.integer "move_id", null: false
    t.text "move_exp"
    t.integer "meal_id", null: false
    t.text "meal_exp"
    t.integer "excretion_id", null: false
    t.text "excretion_exp"
    t.integer "oral_id", null: false
    t.text "oral_exp"
    t.integer "bathing_id", null: false
    t.text "bathing_exp"
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.date "birth", null: false
    t.integer "room_number", null: false
    t.text "picture"
    t.integer "status_id", null: false
    t.text "careplan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sex_id"
    t.integer "insurance"
  end

  create_table "details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "client_id"
    t.text "past_history"
    t.text "illness"
    t.text "medicine"
    t.integer "mbp_high", null: false
    t.integer "mbp_low", null: false
    t.string "doctor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "majors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "room_id", null: false
    t.integer "user_id", null: false
    t.text "content", null: false
    t.text "picture"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.integer "major_item_id", null: false
    t.integer "main_item_id", null: false
    t.integer "sub_item_id", null: false
    t.boolean "remind"
    t.integer "carryout_id", null: false
    t.integer "meal_m_id"
    t.integer "meal_s_id"
    t.integer "water_amount", default: 0
    t.integer "exc_shape_id"
    t.integer "exc_amount_id"
    t.integer "urine_amount", default: 0
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_records_on_client_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_relationships_on_client_id"
    t.index ["user_id", "client_id"], name: "index_relationships_on_user_id_and_client_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.datetime "occ_time", null: false
    t.integer "place_id", null: false
    t.integer "genre_id", null: false
    t.integer "res_id", null: false
    t.integer "level_id", null: false
    t.text "content"
    t.text "picture"
    t.text "coping"
    t.integer "contact_id"
    t.text "hospital"
    t.datetime "desc_date"
    t.integer "desc_user"
    t.text "desc_content"
    t.text "count_content"
    t.integer "check_id", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "room_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_room_users_on_room_id"
    t.index ["user_id"], name: "index_room_users_on_user_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "staff_number", null: false
    t.integer "position_id", null: false
    t.integer "qualification_id", null: false
    t.integer "work_style_id", null: false
    t.text "picture"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "records", "clients"
  add_foreign_key "records", "users"
  add_foreign_key "relationships", "clients"
  add_foreign_key "relationships", "users"
  add_foreign_key "room_users", "rooms"
  add_foreign_key "room_users", "users"
end
