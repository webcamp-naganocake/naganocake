class Customers::OrdersController < ApplicationController

	def about
		@order = Order.new(order_params)
		@customer = current_customer
		@addresses = ShippingAddress.where(customer_id: current_customer.id)
	end

	def save
		@order = Order.new(order_params)
		@order.customer_id = current_customer
		@a = params[:order][:a_mathod]
		if @a == 0
			@order.post_code = @customer.postal_code
			@order.address = @customer.address
			@order.name = @customer.last_name + @customer_first_name
			@order.save
			redirect_to customers_orders_path
		elsif @a == 1
			@order.post_code = params[:order][:shipping_address_for_order].postal_code
			@order.address = params[:order][:shipping_address_for_order].address
			@order.name = params[:order][:shipping_address_for_order].name 
			@order.save
			redirect_to customers_orders_path
		elsif @a == 2
			@order.save
			redirect_to customers_orders_path
		else
			render 'customers_orders_about'
		end
	end

	def confirm
	end

	def create
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
       params.permit(:postage, :total_payment, :payment_method, :ordr_status, :post_code, :address, :name)
    end
end

end

