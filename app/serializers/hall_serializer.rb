class HallSerializer
  include JSONAPI::Serializer
  attributes :name, :capacity
end
