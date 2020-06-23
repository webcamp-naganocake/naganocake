class Customers::ItemsController < ApplicationController

 def top
  @genres = Genre.all
 end

 def index
 	@items = Item.all.page(params[:page]).per(8)
  @genres = Genre.all
 end

 def show
 	@item = Item.find(params[:id])
 	@cart_item = CartItem.new
  @genres = Genre.all
 end

end
