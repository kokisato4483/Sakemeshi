class SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "レシピ名"
      @recipes = Recipe.looks(params[:search], params[:word])
      render "/layouts/search_result"

    else
      @customers = Customer.looks(params[:search], params[:word])
      render "/layouts/search_result"

    end
  end

end
