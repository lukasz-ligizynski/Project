# frozen_string_literal: true

module Ticket_desks
  module UseCases
    class Update
      attr_reader :repository

      def initialize(repository: Ticket_desks::Repository.new)
        @repository = repository
      end

      def call(id:, params:)
        repository.update(id, params)
      end
    end
  end
end
