class SearchesController < ApplicationController

  def search
    @range = params[:range]
#レシピ名の検索
    if @range == "レシピ名"
      @recipes = Recipe.looks(params[:search], params[:word]).page(params[:page]).per(10)
      render "/layouts/search_result"
#ユーザー名の検索
    else
      @customers = Customer.looks(params[:search], params[:word]).page(params[:page]).per(10)
      render "/layouts/search_result"

    end
  end

end
