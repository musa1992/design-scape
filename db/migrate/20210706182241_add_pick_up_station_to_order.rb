class AddPickUpStationToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :pick_up_station, foreign_key: true
  end
end
