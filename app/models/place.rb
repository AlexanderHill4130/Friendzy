class Place < ApplicationRecord
  has_many :place_categories
  has_many :interests, through: :place_categories

  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true
end
