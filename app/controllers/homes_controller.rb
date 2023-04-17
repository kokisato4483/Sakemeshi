class HomesController < ApplicationController
  
  def top
        @recipes = Recipe.limit(10).order(created_at: :DESC)
  end
  
  def about

  end
  
end
