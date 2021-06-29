class Product < ApplicationRecord
  belongs_to :merchant_account
  has_many :ordered_items
  has_one_attached :image
end
