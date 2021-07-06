class ProductsController < ApplicationController

    def new
        @product = Product.new
    end

    def create
        #come back and fix the logic
        account = current_user.account
        merchant = account.merchant_accounts.first
        @product = merchant.products.build(product_params)
        if @product.save
            redirect_to @product, notice: "Design successfully added."
        else
            render 'new'
        end
    end

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to @product, notice: "Product successfully updated"
        else
            render 'edit'
        end
    end

    def destroy

    end

    private

    def product_params
        params.require(:product).permit(:price, :image)
    end
end
