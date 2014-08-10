class UsersController < ApplicationController
   before_action :authenticate_user!

   def show
    @user = User.find(params[:id])
    @polish = Polish.find(params[:id])
    @favorited = @user.favorite_polishes
    @wanted = @user.wanted_polishes
    @owned = @user.owned_polishes
    @reviews = @user.reviews
   end
 
   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       render "devise/registrations/edit"
     end
   end
 
   private
 
   def user_params
     params.require(:user).permit(:name)
   end
 end