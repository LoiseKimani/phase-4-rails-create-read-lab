class Plant < ApplicationRecord
    validates :name, presence: true
    validates :image, presence: true
    validates :price, presence: true
end