class RemoveEventsGroupTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :participants
    drop_table :event_groups
  end
end
