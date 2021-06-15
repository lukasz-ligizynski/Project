# frozen_string_literal: true

module TicketDesks
  class Repository < ::Base::BaseRepository
    def initialize(adapter: TicketDesk)
      super(adapter: adapter)
    end
  end
end
