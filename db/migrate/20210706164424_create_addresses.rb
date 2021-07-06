class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :estate
      t.string :street
      t.string :apartment_number
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
