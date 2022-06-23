class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_show_path
    else
      render "edit"
    end
  end

  def decline
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_kana,:first_kana,:post_code,:address,:phone_number,:email,:is_deleted)
  end

end
