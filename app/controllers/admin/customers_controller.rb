class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end


private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_kana,:first_kana,:post_code,:address,:phone_number,:email,:is_deleted)
  end




end
