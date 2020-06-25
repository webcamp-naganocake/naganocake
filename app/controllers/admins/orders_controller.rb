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
		order = Order.find(params[:id])
    order.update(order_params)

		if order.order_status == "入金確認"
			order.order_details.update(making_status: "製作待ち")
		end
		redirect_to admins_order_path(order.id)
	end

  private
	def order_params
		params.require(:order).permit(:order_status)
	end


end
