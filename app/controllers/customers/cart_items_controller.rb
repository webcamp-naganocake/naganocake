class Customers::CartItemsController < ApplicationController
    
    def index
        @cart_items = CartItem.all
    end

    def create
        @cart_item = current_customer.cart_items.build(item_id: params[:item_id])
        if @cart_item.save
           flash[:notice] = "#{@cart_item.item.name}をカートに追加しました。"
           redirect_to customers_cart_items_path
        else    
        end
    end

    def update

    end

    def destroy

    end

    def all_destroy

    end

    private
      def cart_item_params
        params.require(:cart_item).permit(:quantity, :item_id, :customer_id)
      end
end
