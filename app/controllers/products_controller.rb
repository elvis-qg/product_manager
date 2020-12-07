class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
    @product
  end

  # GET /products/new
  def new
    @product = Product.new
    @types = Type.all

  end

  # POST /products
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def get_colors
    @type = Type.find(params[:id])
    @colors = @type.colors
    render json: @colors
  end

  def get_sizes
    @type = Type.find(params[:id])
    @sizes = @type.sizes
    render json: @sizes
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :brand, :type_id)
    end
end
