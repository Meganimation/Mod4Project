class Game < ApplicationRecord
    has_many :stores
    has_many :currencies, through: :stores
end
