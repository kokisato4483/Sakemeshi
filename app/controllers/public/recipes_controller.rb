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
    
    
        #以下を追記
    if params[:tag_ids]
      @tweets = []
      params[:tag_ids].each do |key, value|      
        @recipes += Tag.find_by(name: key).tweets if value == "1"
      end
      @recipes.uniq!
    end
    
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.score = Language.get_data(recipe_params[:name])  
    @recipe.customer_id = current_customer.id
    if @recipe.save
      redirect_to public_recipe_path(@recipe)
    else 
      render :new
    end
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
  
  def ranking
    @all_ranks = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(10).pluck(:recipe_id))
    @month_ranks = Recipe.find(Favorite.group(:recipe_id).where(created_at: Time.current.all_month).order('count(recipe_id) desc').limit(10).pluck(:recipe_id))
    @week_ranks = Recipe.find(Favorite.group(:recipe_id).where(created_at: Time.current.all_week).order('count(recipe_id) desc').limit(10).pluck(:recipe_id))
    @today_ranks = Recipe.find(Favorite.group(:recipe_id).where(created_at: Time.current.all_day).order('count(recipe_id) desc').limit(10).pluck(:recipe_id))
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id,:genre_id,:customer_id,:name,:description,:tips,:point,:is_status,:drink,:drink_point,:image, :tag_ids)
  end

end
