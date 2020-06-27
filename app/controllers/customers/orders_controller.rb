class Customers::OrdersController < ApplicationController
	before_action :authenticate_customer!

	def about
		@order = Order.new
		@customer = current_customer
		@addresses = ShippingAddress.where(customer_id: current_customer.id)
	end

	def create
		customer = current_customer

		# sessionを使ってデータを一時保存
		session[:order] = Order.new

		cart_items = current_customer.cart_items

		# total_paymentのための計算
		sum = 0
		cart_items.each do |cart_item|
			sum += (cart_item.item.price_without_tax * 1.1).floor * cart_item.quantity
		end

		session[:order][:postage] = 800
		session[:order][:total_payment] = sum + session[:order][:postage]
		session[:order][:order_status] = 0
		session[:order][:customer_id] = current_customer.id
		# ラジオボタンで選択された支払方法のenum番号を渡している
		session[:order][:payment_method] = params[:method].to_i

		# ラジオボタンで選択されたお届け先によって条件分岐
		destination = params[:a_method].to_i

		# ご自身の住所が選択された時
		if destination == 0

			session[:order][:post_code] = customer.postal_code
			session[:order][:address] = customer.address
			session[:order][:name] = customer.last_name + customer.first_name

		# 登録済住所が選択された時
		elsif destination == 1

			address = ShippingAddress.find(params[:shipping_address_for_order])
			session[:order][:post_code] = address.postal_code
			session[:order][:address] = address.address
			session[:order][:name] = address.name 

		# 新しいお届け先が選択された時
		elsif destination == 2

			session[:new_address] = 2
			session[:order][:post_code] = params[:post_code]
			session[:order][:address] = params[:address]
			session[:order][:name] = params[:name]

		end

		# お届け先情報に漏れがあればリダイレクト
		if session[:order][:post_code].presence && session[:order][:address].presence && session[:order][:name].presence
			redirect_to new_customers_order_path
		else
			redirect_to customers_orders_about_path
		end

	end


	def new
		@cart_items = current_customer.cart_items
	end



	def complete
		order = Order.new(session[:order])
		order.save

		if session[:new_address]
			shipping_address = current_customer.shipping_addresses.new
			shipping_address.postal_code = order.post_code
			shipping_address.address = order.address
			shipping_address.name = order.name
			shipping_address.save
			session[:new_address] = nil
		end

		# 以下、order_detail作成
		cart_items = current_customer.cart_items
		cart_items.each do |cart_item|
			order_detail = OrderDetail.new
			order_detail.order_id = order.id
			order_detail.item_id = cart_item.item.id
			order_detail.quantity = cart_item.quantity
			order_detail.making_status = 0
			order_detail.price = (cart_item.item.price_without_tax * 1.1).floor
			order_detail.save
		end

		# 購入後はカート内商品削除
		cart_items.destroy_all
	end

	def index
		@orders = current_customer.orders
	end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

	# private
		# def shipping_address_params
		# 	params.require(:shipping_address).permit(:customer_id, :postal_code, :name, :address)

	#     def order_params
	#        params.require(:order).permit(:customer_id, :postage, :total_payment, :payment_method, :ordr_status, :post_code, :address, :name)
	#     end


	#     def order_detail_params
	#        params.require(:order_detail).permit(:order_id, :item_id, :quantity, :making_status, :price)
	#     end



end


