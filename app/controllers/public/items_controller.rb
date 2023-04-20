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
    @customer = current_customer
  end

  def genre_search
    @genres = Genre.order(:name)
    @genre = Item.where(genre_id: params[:genre_id]).where(sell_status: '1')
    @items = @genre.order("created_at DESC").page(params[:page]).per(8)
    @genre_name = Genre.find(params[:genre_id])
  end

end
