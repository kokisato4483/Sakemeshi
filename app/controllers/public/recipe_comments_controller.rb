class Public::RecipeCommentsController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_comment,only: [:destroy]

  def destroy
    RecipeComment.find(params[:id]).destroy
    redirect_to  public_recipe_path(params[:recipe_id])
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = current_customer.recipe_comments.new(recipe_comment_params)
    comment.recipe_id = recipe.id
    comment.save
    redirect_to public_recipe_path(recipe)
  end
  
  private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment,:recipe_id,:customer_id)
  end
  
  def correct_comment
      @recipe = RecipeComment.find(params[:id])
    unless @recipe.customer.id == current_customer.id
      redirect_to public_recipes_path
    end
  end
  
end
