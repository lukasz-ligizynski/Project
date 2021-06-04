# frozen_string_literal: true

module Movies
  class Repository < ::Base::BaseRepository
    def initialize(adapter: Movie)
      super(adapter: adapter)
    end
  end
end
