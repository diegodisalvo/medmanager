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

ActiveRecord::Schema.define(version: 2019_07_27_233106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "examinations", force: :cascade do |t|
    t.text "situation", default: ""
    t.integer "pa_max", default: 120
    t.integer "pa_min", default: 80
    t.integer "bpm", default: 80
    t.integer "breath_freq", default: 12
    t.float "temperature", default: 36.0
    t.string "skin", default: "normale"
    t.string "hydration", default: "normale"
    t.string "nutrition", default: "normale"
    t.string "diuresis", default: "normale"
    t.string "alvo", default: "regolare"
    t.boolean "nerv_normal", default: true
    t.boolean "nerv_cosc_clouded", default: false
    t.boolean "nerv_cosc_absent", default: false
    t.boolean "nerv_convulsion", default: false
    t.boolean "nerv_romberg", default: false
    t.boolean "nerv_rigor", default: false
    t.boolean "nerv_motor_deficit", default: false
    t.boolean "nerv_sens_deficit", default: false
    t.boolean "pupils_normal_sx", default: true
    t.boolean "pupils_miosis_sx", default: false
    t.boolean "pupils_mydr_sx", default: false
    t.boolean "pupils_fotoreflex_sx", default: false
    t.boolean "pupils_nystagmus_sx", default: false
    t.boolean "pupils_normal_dx", default: true
    t.boolean "pupils_miosis_dx", default: false
    t.boolean "pupils_mydr_dx", default: false
    t.boolean "pupils_fotoreflex_dx", default: false
    t.boolean "pupils_nystagmus_dx", default: false
    t.boolean "lung_normal_sx", default: true
    t.boolean "lung_rumor_sx", default: false
    t.boolean "lung_dry_rumor_sx", default: false
    t.boolean "lung_emphysema_sx", default: false
    t.boolean "lung_normal_dx", default: true
    t.boolean "lung_rumor_dx", default: false
    t.boolean "lung_dry_rumor_dx", default: false
    t.boolean "lung_emphysema_dx", default: false
    t.boolean "heart_normal", default: true
    t.boolean "heart_arhythmia", default: false
    t.boolean "heart_cyanosis", default: false
    t.boolean "heart_edema", default: false
    t.boolean "abdomen_murphy", default: false
    t.boolean "abdomen_blumberg", default: false
    t.boolean "abdomen_rovsing", default: false
    t.boolean "abdomen_ascites", default: false
    t.boolean "abdomen_giordan_sx", default: false
    t.boolean "abdomen_giordan_dx", default: false
    t.text "other", default: ""
    t.text "therapy", default: ""
    t.string "result", default: ""
    t.boolean "urgent", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "requested_by", default: ""
    t.integer "patient_id"
    t.integer "user_id"
    t.datetime "exam_time"
    t.string "exam_location", default: "Ambulatoriale"
    t.integer "location_id"
    t.index ["location_id"], name: "index_examinations_on_location_id"
    t.index ["patient_id"], name: "index_examinations_on_patient_id"
    t.index ["user_id"], name: "index_examinations_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "title", default: ""
    t.string "address", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations_users", id: false, force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "fname", default: ""
    t.string "lname", default: ""
    t.string "fiscalcode", default: ""
    t.string "address", default: ""
    t.string "city", default: ""
    t.string "province", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone", default: ""
    t.string "gender", default: "M"
    t.date "birth_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fname", default: ""
    t.string "lname", default: ""
    t.string "role", default: "medic"
    t.integer "location_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["location_id"], name: "index_users_on_location_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
