class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order = Order.find(@order_item.order_id)
    @order_items = @order.order_items.all

    is_updated = true
    if @order_item.update(order_item_params)
      @order.update(status: 2) if @order_item.making_status == "in_production"
      @order_items.each do |order_item|
        if order_item.making_status != "production_complete"
          is_updated = false
        end
      end
      @order.update(status: 3) if is_updated
    end
    redirect_to request.referer, notice: "製作ステータスを変更しました"
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end
