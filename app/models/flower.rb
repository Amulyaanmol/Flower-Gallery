class Flower < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
end
