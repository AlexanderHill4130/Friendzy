class CreateEventGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :event_groups do |t|
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
