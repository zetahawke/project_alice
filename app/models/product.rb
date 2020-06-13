class Product < ApplicationRecord
  belongs_to :category
  has_one :stock, dependent: :destroy
  has_many :product_tags, dependent: :destroy
  has_many :tags, through: :product_tags
  has_one_attached :main_image
  has_many_attached :secondary_images

  accepts_nested_attributes_for :stock
  accepts_nested_attributes_for :product_tags, allow_destroy: true

  validates_presence_of :name, :description, :price
end
