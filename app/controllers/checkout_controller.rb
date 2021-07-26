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
end
