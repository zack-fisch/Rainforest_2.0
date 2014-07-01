class ReviewsController < ApplicationController
	before_filter :load_product

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = product.reviews.build(review_params)
  	# AKA
  	# @review = Review.new(
    #   :comment    => params[:review][:comment], 
    #   :product_id => @product.id, 
    #   :user_id    => current_user.id
    # )
  	@review.user_id = current_user.id

  	if @review.save
  		redirect_to products_path, notice: 'Review Created Successfully'
  	else
  		render 'products/new'
  	end
  end


  def destroy
  	@review = Review.find(paras[:id])
  	@review.destroy
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
