# frozen_string_literal: true

module Seances
  class Representer
    attr_reader :seances

    def initialize(seances)
      @seances = seances
    end

    def basic
      seances.map do |seance|
        {
          id: seance.id,
          seance_date: seance.seance_date,
          hall_id: seance.hall_id,
          movie_id: seance.movie_id
        }
      end
    end

    def extended
      seances.map do |seance|
        seance
      end
    end
  end
end
