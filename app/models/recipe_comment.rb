class RecipeComment < ApplicationRecord
  
  belongs_to :customer
  belongs_to :recipe
  
  #バリデーション
  validates :comment, presence: true
  
end
