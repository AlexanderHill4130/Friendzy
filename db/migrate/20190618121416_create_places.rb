class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :category
      t.string :address
      t.integer :rating

      t.timestamps
    end
  end
end
