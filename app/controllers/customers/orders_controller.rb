class Customers::OrdersController < ApplicationController

	def about
		@order = Order.new
		@customer = current_customer
		@addresses = ShippingAddress.where(customer_id: current_customer.id)
	end

	def new
		@cart_items = current_customer.cart_items
		@a = params[:a_mathod]
		if @a == 0
			@order.post_code = @customer.postal_code
			@order.address = @customer.address
			@order.name = @customer.last_name + @customer_first_name

		elsif @a == 1
			@order.post_code = params[:order][:shipping_address_for_order].postal_code
			@order.address = params[:order][:shipping_address_for_order].address
			@order.name = params[:order][:shipping_address_for_order].name 

		elsif @a == 2
			@order = Order.new

		else
			render customers_orders_about_path
		end
	end


	def create
		@order = Order.new(order_params)
		@order_detail = OrderDetail.new(order_detail_params)
		@order.save
		redirect_to customers_orders_complete_path
	end

	def complete
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


