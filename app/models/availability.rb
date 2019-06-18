class Availability < ApplicationRecord
  belongs_to :user

  validates :since_date, presence: true
  validates :until_date, presence: true
end
