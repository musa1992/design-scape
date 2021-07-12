class Order < ApplicationRecord
  belongs_to :account
  has_many :ordered_items
  has_one :address, as: :addressable
  
end
