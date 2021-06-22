# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_610_111_158) do
  create_table 'client_promotions', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'client_id'
    t.integer 'promotion_id'
    t.index ['client_id'], name: 'index_client_promotions_on_client_id'
    t.index ['promotion_id'], name: 'index_client_promotions_on_promotion_id'
  end

  create_table 'clients', force: :cascade do |t|
    t.string 'email'
    t.boolean 'real_user'
    t.string 'name'
    t.integer 'age'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'halls', force: :cascade do |t|
    t.integer 'row'
    t.integer 'pleace'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'capacity'
    t.string 'name'
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'title'
    t.float 'duration'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'genre'
    t.boolean 'adult_only'
    t.string 'description'
  end

  create_table 'promotions', force: :cascade do |t|
    t.string 'descriptions'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'reservations', force: :cascade do |t|
    t.string 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'client_id'
    t.integer 'seance_id'
    t.integer 'ticket_desk_id'
    t.index ['client_id'], name: 'index_reservations_on_client_id'
    t.index ['seance_id'], name: 'index_reservations_on_seance_id'
    t.index ['ticket_desk_id'], name: 'index_reservations_on_ticket_desk_id'
  end

  create_table 'seances', force: :cascade do |t|
    t.integer 'duration'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'seance_date'
    t.integer 'hall_id'
    t.integer 'movie_id'
    t.index ['hall_id'], name: 'index_seances_on_hall_id'
    t.index ['movie_id'], name: 'index_seances_on_movie_id'
  end

  create_table 'ticket_desks', force: :cascade do |t|
    t.boolean 'offline'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'tickets', force: :cascade do |t|
    t.string 'seat'
    t.string 'ticket_type'
    t.float 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'reservation_id'
    t.index ['reservation_id'], name: 'index_tickets_on_reservation_id'
  end

  create_table 'users', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'client_promotions', 'clients'
  add_foreign_key 'client_promotions', 'promotions'
  add_foreign_key 'reservations', 'clients'
  add_foreign_key 'reservations', 'seances'
  add_foreign_key 'reservations', 'ticket_desks'
  add_foreign_key 'seances', 'halls'
  add_foreign_key 'seances', 'movies'
  add_foreign_key 'tickets', 'reservations'
end
