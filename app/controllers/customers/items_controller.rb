class Customers::ItemsController < ApplicationController

 def top
  @genres = Genre.all
 end

 def index
  @genres = Genre.all
  @search = Item.ransack(params[:q])
  @items = @search.result.page(params[:page]).per(8)
 end

 
 def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
  @genres = Genre.all
 end

end
