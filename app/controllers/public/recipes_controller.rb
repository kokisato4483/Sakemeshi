class Public::RecipesController < ApplicationController
  before_action :correct_post,only: [:edit,:update,:destroy]

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      @recipes = @genre.recipes.page(params[:page]).per(10).order(created_at: :DESC)
    else
      @recipes = Recipe.page(params[:page]).per(10).order(created_at: :DESC)
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.score = Language.get_data(recipe_params[:name])  #この行を追加
    @recipe.customer_id = current_customer.id
    @recipe.save
    tags = Vision.get_image_data(@recipe.image)
    tags.each do |tag|
      @recipe.tags.create(name: tag)
    end
      redirect_to public_recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.score = Language.get_data(recipe_params[:name])  #この行を追加
    @recipe.update(recipe_params)
    redirect_to public_recipe_path(@recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to public_customer_path(current_customer)
  end

  def correct_post
    @recipe = Recipe.find(params[:id])
    unless @recipe.customer.id == current_customer.id
      redirect_to public_recipes_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id,:genre_id,:customer_id,:name,:description,:tips,:point,:is_status,:drink,:drink_point,:image)
  end

end
