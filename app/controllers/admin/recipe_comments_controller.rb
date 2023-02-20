class Admin::RecipeCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    RecipeComment.find(params[:id]).destroy
    redirect_to  admin_recipe_path(params[:recipe_id])
  end
  
  private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment,:recipe_id,:customer_id)
  end
  
end
