# frozen_string_literal: true

class Seance < ApplicationRecord
  belongs_to :halls
  belongs_to :movies

  has_many :reservations
end
