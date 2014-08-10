class Polishes::ReviewsController < ApplicationController
	def show
		@polish = Polish.find(params[:polish_id])
		authorize @polish
		@review = Review.find(params[:id])
	end

	def new
		@polish = Polish.find(params[:polish_id])
		@review = Review.new
		authorize @review
	end

	def create
		@polish = Polish.find(params[:polish_id])
		@review = current_user.reviews.build(review_params)
		@review.polish = @polish

		authorize @review
		if @review.save
			redirect_to [@polish, @review], notice: "Review was saved."
		else
			flash[:error] = "There was an error saving your review, please try again."
			render :new
		end
	end

	def destroy
		@polish = Polish.find(params[:polish_id])
		@review = Review.find(params[:id])

		title = @review.title
		authorize @review

		if @review.destroy
			flash[:notice] = "\"#{title}\" was deleted successfully."
			redirect_to @polish
		else
			flash[:error] = "There was a problem deleting the review. Please try again."
			render :show
		end
	end

	def edit
		@polish = Polish.find(params[:polish_id])
		@review = Review.find(params[:id])
		authorize @review
	end

	def update
		@polish = Polish.find(params[:polish_id])
		@review = Review.find(params[:id])

		authorize @review
		
		if @review.update_attributes(review_params)
			flash[:notice] = "Review was updated."
			redirect_to [@polish, @review]
		else
			flash[:error] = "There was a problem saving this review, please try again."
			render :new
		end
	end

	private

	def review_params
		params.require(:review).permit(:title, :body)
	end
end
