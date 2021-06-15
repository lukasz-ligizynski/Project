# frozen_string_literal: true

module Ticket_desks
  class Repository < ::Base::BaseRepository
    def initialize(adapter: Ticket_desk)
      super(adapter: adapter)
    end
  end
end
