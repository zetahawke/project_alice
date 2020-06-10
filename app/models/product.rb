class Product < ApplicationRecord
  belongs_to :category
  has_one :stock
  has_many :product_tags
  has_many :tags, through: :product_tags

  accepts_nested_attributes_for :stock, :product_tags, allow_destroy: true
end
