class Admin::GenresController < ApplicationController

  def index
    @names = Genre.all
    @name = Genre.new
  end

  def create
    @name = Genre.new(genre_params)
    if @name.save
      flash[:notice] = "登録が完了しました"
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def edit
    @name = Genre.find(params[:id])
  end

  def update
    @name = Genre.find(params[:id])
    if @name.update(genre_params)
      flash[:notice] = "編集が完了しました"
      redirect_to :index
    end
  end

private
 
 def genre_params
   params.require(:genre).permit(:name)
 end

end
