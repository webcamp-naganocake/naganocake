class Customers::ShippingAddressesController < ApplicationController
    
    def index
        @shipping_addresses = ShippingAddress.all
    end
    
    def create
        
    end

    def destory

    end

    def edit

    end

    def update

    end

  private
    def shipping_address_params
        params.require(:shipping_address).permit(:customer_id, :name, :postal_code, :address)
    end

end