# frozen_string_literal: true

module Movies
  class Representer
    attr_reader :movies

    def initialize(movies)
      @movies = movies
    end

    def basic
      movies.map do |movie|
        {
          id: movie.id,
          title: movie.title,
          duration: movie.duration,
          genre: movie.genre,
          description: movie.description,
          adult_only: movie.adult_only
        }
      end
    end

    def extended
      movies.map do |movie|
        return movie
      end
    end
  end
end
