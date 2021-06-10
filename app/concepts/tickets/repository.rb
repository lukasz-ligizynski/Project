# frozen_string_literal: true

module Tickets
  class Repository < ::Base::BaseRepository
    def initialize(adapter: Ticket)
      super(adapter: adapter)
    end
  end
end
