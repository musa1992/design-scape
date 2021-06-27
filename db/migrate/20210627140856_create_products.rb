class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :merchant_account, null: false, foreign_key: true
      t.decimal :price, :precision => 11, :scale => 2

      t.timestamps
    end
  end
end
