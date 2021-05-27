module UseCase
  module Hall
    class Create < UseCase::Base
      def self.call(attrs, callbacks, repository = HallRepository.new)
        new(attrs, callbacks, repository).call
      end

      def call
        hall = repository.new_entity(attrs)

        if repository.save(hall)
          callbacks[:success].call(hall)
        else
          callbacks[:failure].call(hall)
        end
      end

      private

      def initialize(attrs, callbacks, repository)
        super(attrs, callbacks, repository)
        @attrs = attrs
        @callbacks = callbacks
        @repository = repository
      end

      attr_reader :repository, :callbacks, :attrs
    end
  end
end
