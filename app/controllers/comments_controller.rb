class CommentsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:create]

  def new
    @comment = Comment.new
  end


  def create
    @comment = @product.comments.new(comment_params)
    @comment.save
  end

  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def comment_params
      params.require(:comment).permit(:product_id, :text)
    end
end