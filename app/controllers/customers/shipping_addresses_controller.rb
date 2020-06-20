class Customers::ShippingAddressesController < ApplicationController
    
    before_action :authenticate_customer!

    def index
        @shipping_address = ShippingAddress.new
        @shipping_addresses = current_customer.shipping_addresses
    end
    
    def create
        
    end

    def destory

    end

    def edit
        @shipping_address = ShippingAddress.find(params[:id])
    end

    def update
        @shipping_address = ShippingAddress.find(params[:id])
	  if @shipping_address.update(shipping_address_params)
        flash[:success] = "配送先を変更しました"
        redirect_to customers_shipping_addresses_path
	  else
	    render "edit"
	  end
    end

  private
    def shipping_address_params
        params.require(:shipping_address).permit(:customer_id, :name, :postal_code, :address)
    end

end