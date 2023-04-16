class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
  end

  def confirm_deleted
    @customer = current_customer
  end

  def is_deleted
  end

end
