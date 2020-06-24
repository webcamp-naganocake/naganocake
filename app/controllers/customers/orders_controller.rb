class Customers::OrdersController < ApplicationController

	def about
		@order = Order.new
		@customer = current_customer
		@addresses = ShippingAddress.where(customer_id: current_customer.id)
	end

	def create
		customer = current_customer
		session[:order] = Order.new
		address = ShippingAddress.find(params[:shipping_address_for_order])

		cart_items = current_customer.cart_items
		sum = 0
		cart_items.each do |cart_item|
			sum += (cart_item.item.price_without_tax * 1.1).floor * cart_item.quantity
		end
		session[:order][:postage] = 800
		session[:order][:total_payment] = sum + session[:order][:postage]
		session[:order][:order_status] = 0
		session[:order][:customer_id] = current_customer.id
		session[:order][:payment_method] = params[:method].to_i

		a = params[:a_method].to_i
		if a == 0

			session[:order][:post_code] = customer.postal_code
			session[:order][:address] = customer.address
			session[:order][:name] = customer.last_name + customer.first_name

		elsif a == 1


			session[:order][:post_code] = address.postal_code
			session[:order][:address] = address.address
			session[:order][:name] = address.name 



		elsif a == 2
			session[:order][:post_code] = params[:post_code]
			session[:order][:address] = params[:address]
			session[:order][:name] = params[:name]

		end

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
		cart_items = current_customer.cart_items
		cart_items.each do |cart_item|
			order_detail = OrderDetail.new
			order_detail.order_id = order.id
			order_detail.item_id = cart_item.id
			order_detail.quantity = cart_item.quantity
			order_detail.making_status = 0
			order_detail.price = (cart_item.item.price_without_tax * 1.1).floor
			order_detail.save
		end
		cart_items.destroy_all
	end

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

	private
	    def order_params
	       params.require(:order).permit(:customer_id, :postage, :total_payment, :payment_method, :ordr_status, :post_code, :address, :name)
	    end


	    def order_detail_params
	       params.require(:order_detail).permit(:order_id, :item_id, :quantity, :making_status, :price)
	    end

	end


