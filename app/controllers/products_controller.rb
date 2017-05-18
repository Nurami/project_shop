class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  expose_decorated :product
  expose_decorated :products, -> { fetch_products }

  expose :comment, -> { Comment.new }

  def index
  end

  def show
  end

  def create
    if product.save
      redirect_to product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if product.update(product_params)
      redirect_to product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    product.destroy

    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def fetch_products
    products = Product.all
    products = products.where("title ILIKE ?", "%#{params[:search]}%") if params[:search]
    products
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :amount)
  end
end