module Halls
  class Representer
    attr_reader :halls

    def initialize(halls)
      @halls = halls
    end

    def basic
      halls.map do |hall|
        {
            id: hall.id,
            name: hall.name,
            capacity: hall.capacity
        }
      end
    end

    def extended
      halls.map do |hall|
        hall
      end
    end
  end
end