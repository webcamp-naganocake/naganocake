class Customers::CartItemsController < ApplicationController
    before_action :authenticate_customer!

    def index
        @cart_items = current_customer.cart_items
    end

    def create
        @cart_item = current_customer.cart_items.build(cart_item_params)
        if @cart_item.save
           flash[:notice] = "#{@cart_item.item.name}をカートに追加しました。"
           redirect_to customers_cart_items_path
        else
            flash[:alert] = "個数を選択してください"
            render "customers/items/show"
        end
    end

    def update
        @cart_item = CartItem.find(params[:id])
        if @cart_item.update(cart_item_params)
           flash[:notice] = "#{@cart_item.item.name}をカートに追加しました。"
           redirect_to customers_cart_items_path
        else
            flash[:alert] = "個数を選択してください"
            render "customers/items/show"
        end
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        flash.now[:alert] = "#{@cart_item.item.name}を削除しました"
        合計金額を再計算するアクション
    end

    def all_destroy
        @cart_item = current_customer.cart_items
        @cart_item.destroy
        flash[:alert] = "カートの商品を全て削除しました"
        redirect_to customers_cart_items_path
    end

    private
      def cart_item_params
        params.require(:cart_item).permit(:quantity, :item_id, :customer_id)
      end

end
