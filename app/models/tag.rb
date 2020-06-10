class Tag < ApplicationRecord
  has_many :product_tags
  has_many :products, through: :product_tags

  validates_presence_of :name
end
