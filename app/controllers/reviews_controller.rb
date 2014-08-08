class ReviewsController < ApplicationController
	respond_to :html, :js
	def create
		@polish = polishes.find(params[:polish_id])
		@reviews = @polish.reviews

		@review = current_user.reviews.build(review_params)
		@review.polish = @polish
		@new_review = Review.new

		if @review.save
			flash[:notice] = "Review was created."
		else
			flash[:error] = "There was an error saving your review, please try again."
		end

		respond_with(@review) do |f|
			f.html { redirect_to @polish }
		end
	end

	private

	def review_params
		params.require(:review).permit(:title, :body, :polish_id)
	end
end
