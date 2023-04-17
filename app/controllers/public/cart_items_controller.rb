class Public::CartItemsController < ApplicationController

  def index
   @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(params_cart_item)
    @item = Item.find_by(params[:item_id])
    @customer = Customer.find_by(params[:customer_id])
    if cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        cart_item.amount += params[:cart_item][:amount].to_i
        cart_item.save
        redirect_to cart_items_path
    else
         @cart_item.save
         flash[:notice] = "New Item was successfully added to cart."
         redirect_to cart_items_path
    end
  end

  def update
     @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: "商品の数量を変更しました"
    else
      render 'index'
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    render 'index'
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    render 'index'
  end

  private
  def params_cart_item
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
