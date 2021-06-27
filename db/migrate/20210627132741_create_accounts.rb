class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.boolean :merchant_account, default: false

      t.timestamps
    end
  end
end
