class WantsController < ApplicationController
	def create
		@polish = Polish.find(params[:polish_id])
		want = current_user.wants.build(polish: @polish)

		authorize want

		if want.save
			flash[:notice] = "Marked nail polish as wanted!"
			redirect_to @polish
		else
			flash[:error] = "Unable to add as wanted. Please try again."
			redirect_to @polish
		end
	end

	def destroy
		@polish = Polish.find(params[:polish_id])
		want = current_user.wants.find(params[:id])

		authorize want

		if want.destroy
			flash[:notice] = "Removed from wanted."
			redirect_to @polish
		else
			flash[:error] = "Unable to remove from wanted. Please try again."
			redirect_to @polish
		end
	end
end
