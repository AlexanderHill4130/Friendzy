class Interest < ApplicationRecord

  has_many :user_interests
  has_many :place_categories
  has_many :places, through: :place_categories

  validates :name, presence: true

end
