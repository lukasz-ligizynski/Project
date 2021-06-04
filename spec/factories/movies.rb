# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { 'Some Title' }
    duration { 120 }
    adult_only { 0 }
    description { 'Some description' }
    genre { 'some genre' }
  end
end
