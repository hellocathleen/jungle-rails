class ReviewsController < ApplicationController
  before_filter :require_login

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    @review.save
      if @review.save
        puts "SUCCESS!!"
        redirect_to product_path(@review.product)
      else 
        puts "NOPE!"
        redirect_to :back
      end
  end

  def destroy
    #@product = Review.find(params[:id]).product
    if Review.find(params[:id]).destroy
      redirect_to :back
    end
  end

    private
    def review_params
      params.require(:review).permit(:user_id, :product_id, :description, :rating)
    end

    def require_login
      unless session[:user_id]
        flash[:error] = "You must be logged in!"
        redirect_to new_sessions_path
      end
    end

end
