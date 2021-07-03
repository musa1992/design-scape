class MerchantAccount < ApplicationRecord
  belongs_to :account
  has_many :products
  has_many :ordered_items, through: :products
  
end
