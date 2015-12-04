class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant) }
        format.js # app/views/reviews/create.js.erb
      end
    else
      respond_to do |format|
        format.html { render 'restaurants/show' }
        format.js # app/views/reviews/create.js.erb
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
