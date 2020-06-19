class Admins::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_items_path
    else
      flash[:genre_created_error] = "ジャンル名を入力してください"
    redirect_to
    end
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :description, :price_without_tax, :image_id, :is_sales_status)
  end
end
