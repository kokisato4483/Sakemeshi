class Genre < ApplicationRecord
  
  has_many :recipes, dependent: :destroy
  
#バリデーション
  validates :category, presence: true
  
end
