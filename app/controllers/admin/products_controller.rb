module Admin
  class ProductsController < AdminController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :set_form_url, only: [:edit, :new]
  
    # GET /products
    # GET /products.json
    def index
      @products = Product.all
    end
  
    # GET /products/1
    # GET /products/1.json
    def show
    end
  
    # GET /products/new
    def new
      @product = Product.new
      @product.stock ||= Stock.new
    end
  
    # GET /products/1/edit
    def edit
    end
  
    # POST /products
    # POST /products.json
    def create
      @product = Product.new(product_params)
      # purge_attachments
  
      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
      purge_attachments
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /products/1
    # DELETE /products/1.json
    def destroy
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:name, :description, :price, :minimum_price, :minimum_quantity, :facebook_link, :instagram_link, :category_id, :main_image, secondary_images: [], stock_attributes: [:amount, :id], product_tags_attributes: [:tag_id, :product_id])
      end

      def set_form_url
        @url = params[:action] == 'edit' ? admin_product_path(@product) : admin_products_path
      end

      def purge_attachments
        ['main_image', 'secondary_images'].each do |kind|
          @product.send(kind).purge
          @product.send(kind).attach(params[kind.try(:to_sym)])
        end
      end
  end
end
