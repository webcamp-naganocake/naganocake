class Admins::ItemsController < ApplicationController
  def show
  end

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
  end

  def edit
  end

  def update
  end
end
