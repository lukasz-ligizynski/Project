class ClientPromotion < ApplicationRecord
    belongs_to :promotions
    belongs_to :clients
end
