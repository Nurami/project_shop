class OrdersController < ApplicationController
  before_action :authenticate_user!

  expose_decorated :order
  expose_decorated :orders, -> { fetch_orders }

  def new
    initialize_order
    empty_cart

    redirect_to orders_path
  end

  def index; end

  def show; end

  private

  def fetch_orders
    current_user.orders.order("created_at ASC")
  end

  def initialize_order
    order = current_user.orders.create status: "in_progress"
    order.products << Product.where(id: session[:cart])
  end

  def empty_cart
    session[:cart] = []
  end
end
