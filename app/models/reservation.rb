# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :ticket_desk
  belongs_to :seance
  belongs_to :client

  has_many :tickets
end
