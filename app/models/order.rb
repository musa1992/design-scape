class Order < ApplicationRecord
  belongs_to :account
  belongs_to :pick_up_station
  has_many :ordered_items
  has_one :address, as: :addressable
  
end
