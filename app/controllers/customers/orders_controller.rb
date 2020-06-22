class Customers::OrdersController < ApplicationController

	def about
		@order = Order.new(order_params)
	end

	def new
		@order = Order.new(order_params)
		@order.customer_id = current_customer.id
		# 確認画面へのパス確定後、コメントアウト解除
		# if @order.save
			# redirect_to 確認画面へのパス
		# else
			# render 'customers_orders_about'
		# end
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
       params.require(:order).permit(:customer_id, :postage, :total_payment, :payment_method, :ordr_status, :post_code, :address, :name)
    end
end

