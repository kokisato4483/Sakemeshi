class Public::RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    redirect_to public_recipes_path
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
  end

  def update
  end



  def destroy
  end

    private
  def recipe_params
    params.require(:recipe).permit(:id,:genre_id,:image,:customer_id,:name,:description,:tips,:point,:is_status,:drink,:drink_point)
  end

end
