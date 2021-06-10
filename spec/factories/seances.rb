# frozen_string_literal: true

FactoryBot.define do
  factory :seance do
    duration { 120 }
    movie { create(:movie) }
    hall { create(:hall) }
  end
end
