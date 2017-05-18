class CartProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart

  expose_decorated :products, -> { initialize_products }

  def index
  end

  def new
    session[:cart] << params[:product_id] if Product.find_by(id: params[:product_id])

    session[:cart].uniq!

    redirect_to :back
  end

  def destroy
    session[:cart].delete(params[:id])

    redirect_to :back
  end

  private

  def initialize_products
    Product.where id: session[:cart]
  end

  def initialize_cart
    session[:cart] = [] unless session[:cart]
  end
end