class Api::ProductsController < ApplicationController
  def index
    p current_user
    # @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    # if params[:discount] == 'true'
    #   @products = @products.where("price < 100")
    # else
    #   @products = Product.all
    # end
    # if params[:sort] == 'asc_price'
    #   @products = Product.all.order(:price)
    # else
    #   @products = Product.all.order(:id)
    # end
    # if params[:sort] == 'desc_price'
    #   @products = Product.all.order(price: :desc)
    # else
    #   @products = Product.all.order(:id)
    # end
    if current_user
      @products = Product.all
      render 'index.json.jb'
    else
      @products = []
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      url: params[:url],
      description: params[:description]
    )
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.url = params[:url] || @product.url
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
  
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render 'destroy.json.jb'
  end
end
