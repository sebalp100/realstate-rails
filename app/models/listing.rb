class Listing < ApplicationRecord
  validates :address, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
