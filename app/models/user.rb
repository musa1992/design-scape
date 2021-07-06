class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :account
  has_many :addresses, as: :addressable
  after_create :create_account

  def create_account
    Account.new({user_id: self.id}).save
  end

  def has_merchant_account?
    return false if self.account.nil?
    self.account.merchant_account
  end
  
end
