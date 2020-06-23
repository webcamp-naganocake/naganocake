class Customers::OrdersController < ApplicationController

	def about
		@order = Order.new(order_params)
	end

	def new
		@cart_items = current_customer.cart_items
		
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



# local: trueがない場合、Rails 5ではAjaxによる送信という意味になります。ふつうにHTMLとしてフォームを送信する場合にlocal:trueが必要となります。
# hidden_field:ユーザーに見せる必要はないシステム内の処理をするのに必要な画面情報（ID値や商品名など）を画面に保持しておき、次の処理のときに渡すためのパラメータなどを格納しておくといった役割です。

 