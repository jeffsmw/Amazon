class ReviewsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]


  def create
    @product  = Product.find params[:product_id]
    review_params = params.require(:review).permit([:body,:stars])
    @review   = Review.new review_params
    @review.user = current_user
    @review.product = @product
    if @review.save
      redirect_to product_path(@product), notice: 'Review created!'
    else
      render 'products/show', notice: 'Review not created!'
    end
  end

  # def destroy
  #   product = Product.find params[:product_id]
  #   review = Review.find params[:id]
  #   review.destroy
  #   redirect_to product_path(product), notice: 'Answer deleted!'
  # end
end
