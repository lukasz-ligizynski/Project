# frozen_string_literal: true

module Reservations
  module UseCases
    class Create
      attr_reader :repository

      def initialize(repository: Reservations::Repository.new)
        @repository = repository
      end

      def call(params:)
        @reservation = repository.create(params)
        cancel_reservation
        @reservation
      end
      
      def cancel_reservation
        unless @reservation.status == "paid"
          CancelReservationsJob.set(wait_until: cancel_time).perform_later(@reservation.id)
        end
      end

      def cancel_time
        @seance ||= Seances::Repository.new.find_by(@reservation.seance_id)
        @seance.seance_date - 30.minutes
      end
    end
  end
end
