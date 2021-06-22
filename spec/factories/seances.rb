# frozen_string_literal: true

FactoryBot.define do
  factory :seance do
    duration { 120 }
    seance_date { '2021/07/16 08:00:00' }
    movie { create(:movie) }
    hall { create(:hall) }
  end
end
