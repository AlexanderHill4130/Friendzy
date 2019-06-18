class Place < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true

  has_many :place_categories
  has_many :places, through: :place_categories
end
