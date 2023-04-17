class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal}
    if params[:order][:select_address] == "0"
       @order=Order.new(order_params)
       @order.post_code = current_customer.post_code
       @order.address = current_customer.address
       @order.name = current_customer.family_name + current_customer.first_name
    elsif params[:order][:select_address]== "1"
       @order=Order.new(order_params)
       @address = Address.find(params[:order][:address_id])
       @order.post_code = @address.post_code
       @order.address = @address.address
       @order.name = @address.name
    else
      @order = Order.new(order_params)
    end

  end

  def finish
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end

end
