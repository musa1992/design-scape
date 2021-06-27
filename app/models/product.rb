class Product < ApplicationRecord
  belongs_to :merchant_account
  has_many :ordered_items
end
