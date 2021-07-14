class Estate < ApplicationRecord
  belongs_to :city
  has_many :pick_up_stations, dependent: :destroy
end
