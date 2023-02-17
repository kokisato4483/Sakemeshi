class Public::IngredientsController < ApplicationController

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    redirect_to request.referer
  end

  def update
  end

  def destroy
  end

private

  def ingredient_params
    params.require(:ingredient).permit(:recipe_id,:name,:count)
  end

end
