class FavoritesController < ApplicationController
	def create
		@polish = Polish.find(params[:polish_id])
		favorite = current_user.favorites.build(polish: @polish)

		authorize favorite

		if favorite.save
			flash[:notice] = "Favorited polish!"
			redirect_to @polish
		else
			flash[:error] = "Unable to add as favorite. Please try again."
			redirect_to @polish
		end
	end

	def destroy
		@polish = Polish.find(params[:polish_id])
		favorite = current_user.favorites.find(params[:id])

		authorize favorite

		if favorite.destroy
			flash[:notice] = "Removed favorite."
			redirect_to @polish
		else
			flash[:error] = "Unable to remove favorite. Please try again."
			redirect_to @polish
		end
	end
end
