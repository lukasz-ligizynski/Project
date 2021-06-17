# frozen_string_literal: true

module Reservations
  module UseCases
    class Create
      attr_reader :repository

      def initialize(repository: Reservations::Repository.new)
        @repository = repository
      end

      def call(params:)
        repository.create(params)
        CancelReservationsJob.set(wait_until: cancel_time).perform_later(reservation.id)
      end

      def seances
        @seances ||= Seances::Repository.new.find(params[:seance_id])
      end

      def cancel_time
        seances.starts_at - 30.minutes
      end
    end
  end
end
