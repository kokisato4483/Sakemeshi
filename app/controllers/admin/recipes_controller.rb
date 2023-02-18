class Admin::RecipesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
      @genres = Genre.all
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      @recipes = @genre.recipes
    else
      @recipes = Recipe.all
    end

  end

  def destroy
  end

  def show
  end

  def edit
  end

  def update
  end
end
