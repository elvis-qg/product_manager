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
    validate_product = false
    if params["type"] == "1"
      params["variants"].each do |color, sizes|
        if sizes.include?("2")
          validate_product = true
          break
        end
      end
      p validate_product
      if validate_product
        product = Product.create!(name: params["name"], brand: params["brand"], type_id: params["type"].to_i)
        params["variants"].each do |color, sizes|
          sizes.each do |size|
            ProductVariant.create!(product_id: product.id, color_id: color.to_i, size_id: size.to_i)
          end
        end
        respond_to do |format|
          format.html { redirect_to action: "index", status: 200 }
        end
      else
        respond_to do |format|
          format.html { render :new }
          @errors = {errors: ["Must have M size for hoddies"]}
          format.json { render json:  @errors, status: :unprocessable_entity }
        end
      end  
    end
    
    if params["type"] == "2"
      if params["variants"].key?("5")
        product = Product.create!(name: params["name"], brand: params["brand"], type_id: params["type"])
        params["variants"].each do |color, sizes|
          sizes.each do |size|
            ProductVariant.create!(product_id: product.id, color_id: color.to_i, size_id: size.to_i)
          end
        end
        respond_to do |format|
          format.html { redirect_to action: "index", status: 200 }
        end
      end
      respond_to do |format|
        format.html { render :new }
        @errors = { errors:["Must have red shoes in your variants"] }
        format.json { render json: @errors , status: :unprocessable_entity }
      end
    end
    
  ##  @product = Product.new(product_params)
##
  ##  respond_to do |format|
  ##    if @product.save
  ##      format.html { redirect_to @product, notice: 'Product was successfully created.' }
  ##    else
  ##      format.html { render :new }
  ##    end
  ##  end
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
