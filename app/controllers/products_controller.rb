class ProductsController < ApplicationController

    def new
        @procduct = Product.new
    end

    def create

    end

    def index
        @products = Product.all
    end

    private

    def product_params
        params.require(:product).permit(:price, :image)
    end
end
