# frozen_string_literal: true

class ClientPromotion < ApplicationRecord
  belongs_to :promotions
  belongs_to :clients
end
