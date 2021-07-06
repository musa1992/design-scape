class CreateEstates < ActiveRecord::Migration[6.1]
  def change
    create_table :estates do |t|
      t.string :estate_name
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
