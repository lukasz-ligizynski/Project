# frozen_string_literal: true

class Promotion < ApplicationRecord
  has_many :client_promotions
end
