# frozen_string_literal: true

module Clients
  class Representer
    attr_reader :clients

    def initialize(clients)
      @clients = clients
    end

    def basic
      clients.map do |client|
        {
          id: client.id,
          name: client.name,
          age: client.age,
          real_user: client.real_user
        }
      end
    end

    def extended
      clients.map do |client|
        client
      end
    end
  end
end
