class Admins::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :is_customer_status)
  end
end
