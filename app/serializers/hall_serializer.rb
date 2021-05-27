class HallSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :capacity
end
