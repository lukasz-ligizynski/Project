module UseCase
  module Hall
    class UpdateHall < UseCase::Base
      def self.call(hall, attrs, callbacks, repository = HallRepository.new)
        new(hall, attrs, callbacks, repository).call
      end

      def call
        hall.assign_attributes(attrs)

        if repository.save(hall)
          callbacks[:success].call(hall)
        else
          callbacks[:failure].call(hall)
        end
      end

      private

      def initialize(hall, attrs, callbacks, repository)
        super(hall, attrs, callbacks, repository)
        @hall = hall
        @attrs = attrs
        @callbacks = callbacks
        @repository = repository
      end

      attr_reader :hall, :repository, :callbacks, :attrs
    end
  end
end