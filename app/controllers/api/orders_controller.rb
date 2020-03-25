class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def create
    @cart = current_user.carted_products.where(status: 'carted')
    subtotal = 0
    tax = 0
    total = 0
    @cart.each do |product|
      subtotal += product.product.price * product.quantity
      tax += product.product.tax * product.quantity
      total += product.product.total * product.quantity
    end
    
    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )

    if @order.save
      @cart.each do |product|
        product.update(order_id: @order.id, status: 'purchased')
      end
      render 'show.json.jb'
    else
      render json: {errors: @order.errors.full_messages}
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
