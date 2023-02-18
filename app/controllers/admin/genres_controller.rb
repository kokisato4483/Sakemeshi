class Admin::GenresController < ApplicationController
  #管理者ログインの権限
  before_action :authenticate_admin!
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  def create
     @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index and return
    end
  end
  
  private
  #ストロングパラメータを設定することでデータを一時保持
  def genre_params
    params.require(:genre).permit(:category)
  end
  
end