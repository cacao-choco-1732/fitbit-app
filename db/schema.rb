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

ActiveRecord::Schema.define(version: 2018_06_15_065702) do

  create_table "activity_steps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "fitbit_account_id", null: false
    t.date "tracking_date"
    t.integer "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fitbit_account_id", "tracking_date"], name: "index_activity_steps_on_fitbit_account_id_and_tracking_date", unique: true
  end

  create_table "fitbit_accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "client_id"
    t.string "client_secret"
    t.string "scopes"
    t.string "user_id"
    t.string "token", limit: 1024
    t.string "refresh_token", limit: 1024
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
