class Account < ApplicationRecord
    has_many :merchant_accounts
    has_many :orders
    belongs_to :user
end
