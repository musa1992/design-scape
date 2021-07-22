class CheckoutController < ApplicationController

    def index
        @address = Address.new
        @cities = City.all
    end
end
