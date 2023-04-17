class Public::CustomersController < ApplicationController
 # before_action :authenticate_customer!,only: [:edit,:update,:out,:quit]

  def show
    @customer = Customer.find(params[:id])
    @recipes = @customer.recipes.page(params[:page]).per(10).order(created_at: :DESC)
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       redirect_to public_customer_path(current_customer)
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
    @customer = current_customer
  end

  def favorites
    @customer = Customer.find(params[:id])
    favorites= Favorite.where(customer_id: @customer.id).pluck(:recipe_id)
    @favorites = Recipe.find(favorites)
    @favorites = Kaminari.paginate_array(@favorites).page(params[:page]).per(10)
  end

  private

  def customer_params
    params.require(:customer).permit(:is_deleted, :name, :email, :profile_image)
  end


end
