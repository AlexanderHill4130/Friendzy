class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.datetime :since_date
      t.datetime :until_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
