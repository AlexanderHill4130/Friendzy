class Interest < ApplicationRecord

  has_many :user_interests

  validates :name, presence: true
end
