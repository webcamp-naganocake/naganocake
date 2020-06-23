class Admins::OrdersController < ApplicationController

	def index
		@orders = Order.page(params[:page]).per(10)
	end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

	def total(items_total_price)

	end

	def update
	end

  private
	def order_params
		params.require(:order).permit(:order_status)
	end

	def order_detail_params
		params.require(:order_detail).permit(:item_status)
	end

end
