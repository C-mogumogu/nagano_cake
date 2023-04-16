class Public::CartItemsController < ApplicationController

  def index
  end

  def show
  end

  def create
    @item = Item.find_by(params[:item_id])
    @cart_item = CartItem.new(params_cart_item)
    #@cart_item.customer_id = current_customer.id
    @cart_item.item_id = Item.find_by(params[:item_id])
    @cart_item.save
    redirect_to cart_items_path
  end

  private
  def params_cart_item
    params.require(:cart_item).permit(:item_id, :amount) #customer_idをあとで追加
  end
end
