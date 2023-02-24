class Recipe < ApplicationRecord

  belongs_to :customer
  belongs_to :genre
  has_one_attached :image
  
  has_many :recipe_comments, dependent: :destroy 
  has_many :favorites, dependent: :destroy
  

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def get_image
    (image.attached?) ? image : "no_image.jpg"
  end
  
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

end
