class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]

  def show
    @item = Item.find(params[:id])
  end

  def index
    @search = Item.ransack(params[:q])
    @items = @search.result.page(params[:page]).per(10)
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item)
    else
      flash[:genre_created_error] = "ジャンル名を入力してください"
    redirect_to new_admins_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_items_path(@item)
      flash[:notice_update] = "ジャンル情報を更新しました！"
    else
      redirect_to edit_admins_item_path(@item)
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :description, :price_without_tax, :image, :is_sales_status)
  end
end
