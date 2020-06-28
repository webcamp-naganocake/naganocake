class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @search = Customer.ransack(params[:q])
    @customers = @search.result.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admins_customer_path(@customer)
      flash[:notice_update] = "ジャンル情報を更新しました！"
    else
      edit_admins_customer_path(@customer)
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :is_customer_status)
  end
end
