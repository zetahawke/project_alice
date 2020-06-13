class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  # GET /products
  # GET /products.json
  def index
    @products = params[:tag_id] ? Product.left_outer_joins(:tags).where(tags: { id: params[:tag_id] }).distinct : Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show; end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
