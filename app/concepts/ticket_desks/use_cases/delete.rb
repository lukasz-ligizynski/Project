# frozen_string_literal: true

module Ticket_desk
  module UseCases
    class Delete
      attr_reader :repository

      def initialize(repository: Ticket_desks::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.delete(id)
      end
    end
  end
end
