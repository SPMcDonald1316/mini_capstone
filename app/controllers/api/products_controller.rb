class Api::ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render 'allproducts.json.jb'
  end

  def first_product
    @product = Product.first
    render 'first.json.jb'
  end
end
