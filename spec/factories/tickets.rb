# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    seat { '2F'}
    ticket_type { 'normal' }
    price { 25 }
    reservation { create(:reservation) }
  end
end
