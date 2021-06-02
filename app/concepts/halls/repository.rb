# frozen_string_literal: true

module Halls
  class Repository < ::Base::BaseRepository
    def initialize(adapter: Hall)
      super(adapter: adapter)
    end
  end
end
