class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "登録が完了しました"
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "編集が完了しました"
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :sell_status)
  end

end
