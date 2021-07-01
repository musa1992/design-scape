class MerchantAccountsController < ApplicationController
    
    def new
        @merchant = MerchantAccount.new
    end

    def create
        @merchant = current_user.merchant_accounts.build(merchant_params)

        if @merchant_params.save
            redirect_to :merchant_accounts_path, notice: "Merchant account successfully created"
        else
            render 'new'
        end
    end

    def index
    end

    private

    def merchant_params
        params.require(:merchant_account).permit(:account_name)
    end
    

end
