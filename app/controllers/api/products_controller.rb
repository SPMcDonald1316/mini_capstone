class Api::ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render 'allproducts.json.jb'
  end
end
