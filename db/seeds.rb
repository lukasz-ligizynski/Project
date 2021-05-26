# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    Hall.create(name: 'Green Hall', capacity: 200)
    Hall.create(name: 'Second Hall', capacity: 400)
    Hall.create(name: 'Oh no Hall', capacity: 100)