class Order < ApplicationRecord
  belongs_to :account
  has_many :ordered_items
end
