class MerchantAccount < ApplicationRecord
  belongs_to :account
  has_many :products
  has_many :ordered_items, through: :products
  after_create :update_account_type

  def update_account_type
    account = Account.find(self.account_id)
    account.update(merchant_account: true)
  end
end
