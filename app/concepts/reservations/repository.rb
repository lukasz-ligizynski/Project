# frozen_string_literal: true

module Reservations
  class Repository < ::Base::BaseRepository
    def initialize(adapter: Reservation)
      super(adapter: adapter)
    end
  end
end
