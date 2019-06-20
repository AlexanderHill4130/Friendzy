class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :chatroom_users
  has_many :chatrooms
  has_many :messages

  include PgSearch
  pg_search_scope :search_by_first_name_and_last_name,
                  against: %i[first_name last_name],
                  using: { tsearch: { prefix: true } }
end
