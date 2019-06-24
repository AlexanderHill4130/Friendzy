class Place < ApplicationRecord
  has_many :place_categories
  has_many :interests, through: :place_categories
  has_many :chatrooms

  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true

  include PgSearch
  pg_search_scope :search_by_name_and_category_and_address,
                  against: %i[name category address],
                  using: { tsearch: { prefix: true } }
end
