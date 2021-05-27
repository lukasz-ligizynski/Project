# frozen_string_literal: true

module UseCase
  module Hall
    class DeleteHall < UseCase::Base
      def self.call(hall, callbacks, repository = HallRepository.new)
        new(hall, callbacks, repository).call
      end

      def call
        if repository.delete(hall)
          callbacks[:success].call
        else
          callbacks[:failure].call
        end
      end

      private

      def initialize(hall, callbacks, repository)
        super(hall, callbacks, repository)
        @hall = hall
        @callbacks = callbacks
        @repository = repository
      end

      attr_reader :hall, :repository, :callbacks
    end
  end
end
