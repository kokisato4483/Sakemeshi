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

end
