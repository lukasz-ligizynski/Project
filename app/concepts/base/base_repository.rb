# frozen_string_literal: true

module Base
  class BaseRepository
    attr_reader :adapter

    def initialize(adapter:)
      @adapter = adapter
    end

    def find_all
      adapter.order(:id).all
    end

    def find_by(id)
      adapter.find(id)
    end

    def create(params)
      adapter.create(params)
    end

    def update(id, params)
      adapter.update(id, params)
    end

    def delete(id)
      adapter.destroy(id)
    end
  end
end
