class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       redirect_to public_customers_path
    else
       render :edit and return
    end
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理に成功しました"
    redirect_to root_path
  end

  def quit
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:is_deleted, :name, :email)
  end
  
end
