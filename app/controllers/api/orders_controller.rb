class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def create
    product = Product.find(params[:product_id])
    subtotal = product.price * params[:quantity].to_i
    tax_rate = 0.09
    tax = product.price * tax_rate
    total = subtotal + tax

  
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
    )

    if @order.save
      render 'show.json.jb'
    else
      @order = []
    end
  end

  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def show
    @order = current_user.orders.find(params[:id])
    render 'show.json.jb'
  end
end
