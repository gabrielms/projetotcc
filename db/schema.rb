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

ActiveRecord::Schema.define(version: 20150510171737) do

  create_table "answers", force: :cascade do |t|
    t.integer  "reply_id"
    t.integer  "question_id"
    t.integer  "possible_answer_id"
    t.string   "value"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "answers", ["possible_answer_id"], name: "index_answers_on_possible_answer_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["reply_id"], name: "index_answers_on_reply_id"

  create_table "coaches", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "cref"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "coaches", ["user_id"], name: "index_coaches_on_user_id"

  create_table "inference_results", force: :cascade do |t|
    t.integer  "pupil_id"
    t.integer  "workout_id"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "inference_results", ["pupil_id"], name: "index_inference_results_on_pupil_id"
  add_index "inference_results", ["workout_id"], name: "index_inference_results_on_workout_id"

  create_table "muscle_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "physical_profiles", force: :cascade do |t|
    t.integer  "age"
    t.float    "stature"
    t.float    "weight"
    t.integer  "sex"
    t.integer  "objective"
    t.boolean  "smoker"
    t.boolean  "has_cardiac_problem"
    t.boolean  "has_respiratory_problem"
    t.boolean  "cardiac_diseases_in_family"
    t.integer  "how_often_pratice_exercises"
    t.integer  "how_long_is_on_gym"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "polls", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "physical_profile_id"
  end

  add_index "polls", ["physical_profile_id"], name: "index_polls_on_physical_profile_id"

  create_table "possible_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "possible_answers", ["question_id"], name: "index_possible_answers_on_question_id"

  create_table "pupils", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "physical_profile_id"
  end

  add_index "pupils", ["physical_profile_id"], name: "index_pupils_on_physical_profile_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "poll_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "workout_id"
  end

  add_index "questions", ["poll_id"], name: "index_questions_on_poll_id"
  add_index "questions", ["workout_id"], name: "index_questions_on_workout_id"

  create_table "replies", force: :cascade do |t|
    t.integer  "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "coach_id"
  end

  add_index "replies", ["coach_id"], name: "index_replies_on_coach_id"
  add_index "replies", ["poll_id"], name: "index_replies_on_poll_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "kind",                   default: 2,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "workouts", force: :cascade do |t|
    t.string   "name"
    t.integer  "muscle_group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "workouts", ["muscle_group_id"], name: "index_workouts_on_muscle_group_id"

end
