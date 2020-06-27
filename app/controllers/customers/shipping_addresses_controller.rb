class Customers::ShippingAddressesController < ApplicationController

    before_action :authenticate_customer!

    # 配送先一覧/配送先登録画面
    def index
        @shipping_address = ShippingAddress.new
        @shipping_addresses = current_customer.shipping_addresses
    end

    # 配送先登録ボタン
    def create
        @shipping_address = ShippingAddress.new(shipping_address_params)
        @shipping_address.customer_id = current_customer.id
        if @shipping_address.save
            redirect_to customers_shipping_addresses_path
            flash[:success] = "登録しました。"
        else
            @shipping_address = ShippingAddress.new
            @shipping_addresses = current_customer.shipping_addresses
            render 'index'
        end
    end

    # 配送先を削除する
    def destroy
        shipping_address = ShippingAddress.find(params[:id])
        shipping_address.destroy
        redirect_to customers_shipping_addresses_path
    end 

    # 配送先編集ボタン
    def edit
        @shipping_address = ShippingAddress.find(params[:id])
    end

    # 配送先編集保存ボタン
    def update
        shipping_address = ShippingAddress.find(params[:id])
        shipping_address.update(shipping_address_params)
        redirect_to customers_shipping_addresses_path
    end

    private
    def shipping_address_params
        params.require(:shipping_address).permit(:customer_id, :name, :postal_code, :address)
    end

end