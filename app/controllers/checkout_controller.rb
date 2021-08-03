class CheckoutController < ApplicationController

    def index
        @address = Address.new
        @cities = City.all
    end

    def estate
        city = City.find_by(city_name: params[:city_name])
        @estates = city.estates
        @estate_name = []
        @estates.each do |estate|
            @estate_name << estate.estate_name
        end
        render json: {estates: @estate_name}
    end

    def station
        estate = Estate.find_by(estate_name: params[:estate_name])
        @stations = estate.pick_up_stations
        @station_name = []
        @stations.each do |station|
            @station_name << {name: station.station_name, street: station.street, estate: estate.estate_name}
        end
        render json: {stations: @station_name}
    end
end
