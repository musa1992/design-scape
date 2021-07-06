class PickUpStation < ApplicationRecord
  belongs_to :estate
  has_many :orders
  
end
