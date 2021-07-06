class CartsController < ApplicationController

    def show
        @order = Order.find(5)  
    end

    def add_to_cart
        
        if session.key?(:order_id)
            order = Order.find(session[:order_id])
            order.ordered_items.build(product_id: params[:id]).save
        else
            
            
            account = current_user.account
            @order = account.orders.build(pick_up_station_id: 1)
            if @order.save
                session[:order_id]
                @order.ordered_items.build(product_id: params[:id]).save
            end
            
        end
    end
    
end
