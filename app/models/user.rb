class User < ApplicationRecord

    has_many :currencies, dependent: :destroy

end
