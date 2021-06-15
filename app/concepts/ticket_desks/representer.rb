# frozen_string_literal: true

module Ticket_desks
  class Representer
    attr_reader :ticket_desks

    def initialize(ticket_desks)
      @ticket_desks = ticket_desks
    end

    def basic
      ticket_desks.map do |ticket_desk|
        {
          offline: ticket_desk.offline
        }
      end
    end

    def extended
      ticket_desks.map do |ticket_desk|
        ticket_desk
      end
    end
  end
end
