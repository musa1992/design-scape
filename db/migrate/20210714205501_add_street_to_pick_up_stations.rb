class AddStreetToPickUpStations < ActiveRecord::Migration[6.1]
  def change
    add_column :pick_up_stations, :street, :string
  end
end
