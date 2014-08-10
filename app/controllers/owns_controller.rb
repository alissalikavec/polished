class OwnsController < ApplicationController
	def create
		@polish = Polish.find(params[:polish_id])
		own = current_user.owns.build(polish: @polish)

		authorize own

		if own.save
			flash[:notice] = "Marked nail polish as owned!"
			redirect_to @polish
		else
			flash[:error] = "Unable to add as owned. Please try again."
			redirect_to @polish
		end
	end

	def destroy
		@polish = Polish.find(params[:polish_id])
		own = current_user.owns.find(params[:id])

		authorize own

		if own.destroy
			flash[:notice] = "Removed from owned."
			redirect_to @polish
		else
			flash[:error] = "Unable to remove from owned. Please try again."
			redirect_to @polish
		end
	end
end
