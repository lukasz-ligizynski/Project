# frozen_string_literal: true

module Seances
  class Repository < ::Base::BaseRepository
    def initialize(adapter: Seance)
      super(adapter: adapter)
    end
  end
end
