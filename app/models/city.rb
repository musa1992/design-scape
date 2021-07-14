class City < ApplicationRecord
    has_many :estates, dependent: :destroy
    has_many :pick_up_stations, through: :estates
end
