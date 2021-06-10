# frozen_string_literal: true

class ClientPromotion < ApplicationRecord
  belongs_to :promotion
  belongs_to :client
end
