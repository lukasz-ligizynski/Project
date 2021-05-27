# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :client_promotions
  has_many :reservations
end
