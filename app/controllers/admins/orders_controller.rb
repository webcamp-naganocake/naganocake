class Admins::OrdersController < ApplicationController

	def index
		@orders = Order.page(params[:page]).per(10)
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
	end

end
