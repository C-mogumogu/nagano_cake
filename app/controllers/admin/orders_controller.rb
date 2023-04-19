class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: "注文ステータスを変更しました"
    else
      render 'show'
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end

