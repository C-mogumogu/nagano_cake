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
      flash[:notice] = "編集が成功しました"
      redirect_to customer_path
    else
      render :edit
    end
  end

  def confirm_deleted
    @customer = current_customer
  end

  def is_deleted
    @customer = current_customer
    if @customer.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会しました"
      redirect_to root_path
    else
      render :show
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(
      :family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :is_deleted
      )
  end

end
