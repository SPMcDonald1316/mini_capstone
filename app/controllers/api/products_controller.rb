class Api::ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render 'allproducts.json.jb'
  end

  def first_product
    @product = Product.first
    render 'first.json.jb'
  end

  def second_product
    @product = Product.find_by(id: 2)
    render 'second.json.jb'
  end

  def third_product
    @product = Product.find_by(id: 3)
    render 'third.json.jb'
  end
end
