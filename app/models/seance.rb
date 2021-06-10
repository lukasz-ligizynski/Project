# frozen_string_literal: true

class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie

  has_many :reservations
end
