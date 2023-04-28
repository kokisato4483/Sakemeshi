class RecipeTagRelation < ApplicationRecord
  
  belongs_to :recipe
  belongs_to :recipetag
  
end
