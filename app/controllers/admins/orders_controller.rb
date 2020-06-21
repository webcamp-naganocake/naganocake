class Admins::OrdersController < ApplicationController

	def index
		@customers = Customer.page(params[:page]).per(10)
	end

	def show
	end

	def update
	end

end
