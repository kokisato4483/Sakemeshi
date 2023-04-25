class Recipe < ApplicationRecord

  belongs_to :customer
  belongs_to :genre
  has_one_attached :image
  has_many :tags, dependent: :destroy 
  has_many :tags, through: :recipe_tag_relations, dependent: :destroy
  
  has_many :recipe_comments, dependent: :destroy 
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

#レシピ画像デフォルト
  def get_image
    (image.attached?) ? image : "no_image.jpg"
  end
  
#完全一致・前方一致・後方一致・部分一致
  def self.looks(search, word)
    if search == "perfect_match"
      @recipe = Recipe.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @recipe = Recipe.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @recipe = Recipe.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @recipe = Recipe.where("name LIKE?","%#{word}%")
    else
      @recipe = Recipe.all
    end
  end

  #バリデーション
  with_options presence: true do
    validates :name
    validates :description
    validates :tips
    validates :point
    validates :drink
    validates :drink_point
  end
  

end
