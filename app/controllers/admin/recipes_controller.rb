class Admin::RecipesController < ApplicationController
  before_action :authenticate_admin!

  def index
      @genres = Genre.all
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      @recipes = @genre.recipes.page(params[:page]).order(created_at: :DESC)
    else
      @recipes = Recipe.page(params[:page]).order(created_at: :DESC)
    end

  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to admin_recipes_path
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id,:genre_id,:customer_id,:name,:description,:tips,:point,:is_status,:drink,:drink_point,:image,:created_at)
  end

end
