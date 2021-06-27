class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :account, null: false, foreign_key: true
      t.integer :status, default: 0
      t.decimal :total, :precision => 11, :scale => 2

      t.timestamps
    end
  end
end
