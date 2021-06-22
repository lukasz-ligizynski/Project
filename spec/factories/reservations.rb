# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    status { 'paid' }
    client { create(:client) }
    ticket_desk { create(:ticket_desk) }
    seance { create(:seance) }
  end
end
