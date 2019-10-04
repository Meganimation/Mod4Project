class Game < ApplicationRecord
    has_many :stores, dependent: :destroy
    has_many :currencies, through: :stores, dependent: :destroy
end
