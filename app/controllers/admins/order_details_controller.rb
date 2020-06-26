class Admins::OrderDetailsController < ApplicationController

	def update
		order_detail =
		OrderDetail.find(id: order_detail_id)
		order_detail.update(order_detail_params)

		case order_detail.making_status
		 when "製作中"
				order_detail.order.update(order_status: "製作中")
		 when "製作完了"
			if
				order_detail.order.order_details.all?{|order_details| order_detail.making_status == "製作完了"}
				order_detail.order.update(order_status: "発送準備中")
			end
		end
		redirect_to admins_order_path(order_detail)
	end

	private
   def order_detail_params
		 params.require(:order_detail).permit(:making_status)
	 end

end
