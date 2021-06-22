# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    name { 'some name' }
    age { 18 }
    real_user { true }
    email { 'example@ex.com' }
  end
end
