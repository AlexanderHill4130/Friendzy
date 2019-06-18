class Friendship < ApplicationRecord
  has_many :users
  belongs_to :user
  belongs_to :friend, foreign_key: "friend_id", class_name: "User"
  # belongs_to :users
  # belongs_to :friends
end
