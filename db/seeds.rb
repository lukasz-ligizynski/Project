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

Movie.create(title: "First Movie", duration: "120", adult_only: 0, description: "Some description of the first movie", genre: "comedy" )
Movie.create(title: "Second Movie", duration: "210", adult_only: 1, description: "Some description of the second movie", genre: "drama" )
Movie.create(title: "First Movie 2", duration: "100", adult_only: 0, description: "Some description of the third movie", genre: "comedy" )