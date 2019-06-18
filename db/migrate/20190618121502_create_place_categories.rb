class CreatePlaceCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :place_categories do |t|
      t.references :place, foreign_key: true
      t.references :interest, foreign_key: true

      t.timestamps
    end
  end
end
