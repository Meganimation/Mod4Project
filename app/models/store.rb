class Store < ApplicationRecord
    belongs_to :game, optional: true
    belongs_to :currency, optional: true
end
