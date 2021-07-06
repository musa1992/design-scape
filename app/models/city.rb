class City < ApplicationRecord
    has_many :estates
    has_many :pick_up_stations, through: :estates
end
