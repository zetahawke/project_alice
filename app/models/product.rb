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
  validate :validate_both

  def validate_both
    %w(main_image secondary_images).each { |kind| acceptable_image(kind) if send(kind).attached? }
  end

  def acceptable_image(kind = 'main_image')
    acceptable_types = ["image/jpeg", "image/png"]
    if kind == 'main_image'
      errors.add(kind.try(:to_sym), "is too big") unless send(kind).byte_size <= 1.megabyte
      errors.add(kind.try(:to_sym), "must be a JPEG or PNG") unless acceptable_types.include?(send(kind).content_type)
    else
      errors.add(kind.try(:to_sym), "the batch syze is too big") unless send(kind).sum { |attached_file| attached_file.byte_size } <= 5.megabyte
      send(kind).each { |attached_file|  errors.add(kind.try(:to_sym), "attached images must be a JPEG or PNG") unless acceptable_types.include?(attached_file.content_type)}
    end
  end
end
