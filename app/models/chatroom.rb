class Chatroom < ApplicationRecord
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  has_many :messages, dependent: :destroy
  belongs_to :place

  def available_nonparticipants
    User.all - users
  end
end
