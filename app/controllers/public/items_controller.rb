class Public::ItemsController < ApplicationController
  def index
    @all_items = Item.all
    items = Item.where(sell_status: '1')
    @items = items.order("created_at DESC").page(params[:page]).per(8)
    @genres = Genre.order(:name)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.order(:name)
  end
end
