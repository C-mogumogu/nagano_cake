class Public::ItemsController < ApplicationController
  def index
    @all_items = Item.all
    @item = Item.where(sell_status: '1')
    @items = @item.order("created_at DESC").page(params[:page]).per(8)
    @genres = Genre.order(:name)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.order(:name)
  end
end
