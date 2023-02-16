class Recipe < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
  has_many :post_images, dependent: :destroy
  
end
