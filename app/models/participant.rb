class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :event_group
end