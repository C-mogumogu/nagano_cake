class Public::HomesController < ApplicationController

  def top
    items = Item.where(sell_status: '1')
    @items = items.all.order("created_at DESC").limit(4)
    @genres = Genre.order(:name)
  end

  def about
  end

end
