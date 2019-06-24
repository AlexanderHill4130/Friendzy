class AddPlaceReferenceToChatroom < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatrooms, :place, foreign_key: true
  end
end
