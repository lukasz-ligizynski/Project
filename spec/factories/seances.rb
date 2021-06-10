# frozen_string_literal: true

FactoryBot.define do
  factory :seance do
    duration { 120 }
    movie_id { create(:movie).id }
    hall_id { create(:hall).id }
  end
end
