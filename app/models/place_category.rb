class PlaceCategory < ApplicationRecord
  belongs_to :place
  belongs_to :interest
end
