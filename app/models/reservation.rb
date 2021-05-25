class Reservation < ApplicationRecord
    belongs_to :ticket_desks
    belongs_to :seances
    belongs_to :clients

    has_many :tickets
end
