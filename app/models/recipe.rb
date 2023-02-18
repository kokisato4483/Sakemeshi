class Recipe < ApplicationRecord

  belongs_to :customer
  belongs_to :genre
  has_one_attached :image

  def get_image
    (image.attached?) ? image : "no_image.jpg"
  end

end
