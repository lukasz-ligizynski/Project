# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_25_084611) do

  create_table "client_promotions", force: :cascade do |t|
    t.integer "promotions_id"
    t.integer "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "email"
    t.boolean "real_user"
    t.string "name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "halls", force: :cascade do |t|
    t.integer "row"
    t.integer "pleace"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "capacity"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.float "duration"
    t.string "age_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "genre"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ticket_desks_id"
    t.integer "seances_id"
    t.integer "clients_id"
    t.index ["clients_id"], name: "index_reservations_on_clients_id"
    t.index ["seances_id"], name: "index_reservations_on_seances_id"
    t.index ["ticket_desks_id"], name: "index_reservations_on_ticket_desks_id"
  end

  create_table "seances", force: :cascade do |t|
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "movies_id"
    t.integer "halls_id"
    t.datetime "seance_date"
    t.index ["halls_id"], name: "index_seances_on_halls_id"
    t.index ["movies_id"], name: "index_seances_on_movies_id"
  end

  create_table "ticket_desks", force: :cascade do |t|
    t.boolean "offline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "seat"
    t.string "ticket_type"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "reservations_id"
    t.index ["reservations_id"], name: "index_tickets_on_reservations_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "reservations", "clients", column: "clients_id"
  add_foreign_key "reservations", "seances", column: "seances_id"
  add_foreign_key "reservations", "ticket_desks", column: "ticket_desks_id"
  add_foreign_key "seances", "halls", column: "halls_id"
  add_foreign_key "seances", "movies", column: "movies_id"
  add_foreign_key "tickets", "reservations", column: "reservations_id"
end
