class CreatePickUpStations < ActiveRecord::Migration[6.1]
  def change
    create_table :pick_up_stations do |t|
      t.string :station_name
      t.references :estate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
