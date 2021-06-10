# frozen_string_literal: true

FactoryBot.define do
  factory :seance do
    duration { 120 }

    association :movie
    association :hall
  end
end
