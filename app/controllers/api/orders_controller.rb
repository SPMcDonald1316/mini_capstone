class Api::OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: current_user.id,
      product: Product.find(params[:product_id]),
      quantity: params[:quantity],
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
