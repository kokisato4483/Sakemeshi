class Genre < ApplicationRecord
  
  has_many :recipe, dependent: :destroy
  
end
