class Place < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true
end
