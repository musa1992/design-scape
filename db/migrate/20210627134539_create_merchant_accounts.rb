class CreateMerchantAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :merchant_accounts do |t|
      t.references :account, null: false, foreign_key: true
      t.decimal :balance, :precision => 11, :scale => 2
      t.decimal :amount_on_hold,  :precision => 11, :scale => 2
      t.decimal :total_sales,  :precision => 11, :scale => 2
      t.string :account_name

      t.timestamps
    end
  end
end
