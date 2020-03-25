class Api::CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      status: 'carted',
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    if @carted_product.save
      render 'show.json.jb'
    else
      render json: {messages: @carted_product.errors.full_messages}
    end
  end

  def index
    @carted_products = current_user.carted_products.where(status: 'carted')
    render 'index.json.jb'
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(status: 'removed')
    render json: {message: 'Product has been removed from cart'}
  end
end
