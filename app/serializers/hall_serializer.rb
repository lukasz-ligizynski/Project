# frozen_string_literal: true

class HallSerializer
  include JSONAPI::Serializer
  attributes :name, :capacity
end
