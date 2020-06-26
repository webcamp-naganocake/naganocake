class Customers::ItemsController < ApplicationController

 def top
  @genres = Genre.all
  @items = Item.all
 end

 def index
  @genres = Genre.all
  @search = Item.ransack(params[:q])
  @items = @search.result.page(params[:page]).per(8)
  @items_all = Item.all
 end

 
 def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
  @genres = Genre.all
 end

 def about
    
 end

end
