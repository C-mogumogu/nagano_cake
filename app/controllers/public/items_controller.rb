class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
    @genres = Genre.order(:name)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.order(:name)
  end
end
