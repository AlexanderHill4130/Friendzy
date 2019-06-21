class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :chatroom_users, dependent: :destroy
  has_many :chatrooms, through: :chatroom_users
  has_many :messages, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_first_name_and_last_name,
                  against: %i[first_name last_name],
                  using: { tsearch: { prefix: true } }

  def username
    "#{first_name} #{last_name}"
  end

  def username_initial
    "#{first_name} #{last_name[0].upcase}"
  end
end
