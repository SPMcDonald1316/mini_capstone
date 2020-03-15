class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render 'index.json.jb'
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render 'show.json.jb'
  end
end
