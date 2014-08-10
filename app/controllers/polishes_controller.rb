class PolishesController < ApplicationController
  def index
  	@polishes = Polish.all
    authorize @polishes
  end

  def show
  	@polish = Polish.find(params[:id])
    @reviews = @polish.reviews
    @review = Review.new
    @favorited = @polish.favorite_users
    @wanted = @polish.wanted_users
    @owned = @polish.owned_users
  end

  def new
    @polish = Polish.new
    authorize @polish
  end

  def create
    @polish = current_user.polishes.build(polish_params)
    authorize @polish
    if @polish.save
      flash[:notice] = "Polish saved!"
      redirect_to @polish
    else
      flash[:error] = "There was a problem saving your polish. Please try again."
      render :new
    end
  end

  def destroy
    @polish = Polish.find(params[:id])
    name = @polish.name

    authorize @polish
    if @polish.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to polishes_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

  def edit
    @polish = Polish.find(params[:id])
    authorize @polish
  end

  def update
    @polish = Polish.find(params[:id])
    authorize @polish
    if @polish.update_attributes(polish_params)
      flash[:notice] = "Polish details updated."
      redirect_to @polish
    else
      flash[:error] = "There was an error saving this polish. Please try again!"
      render :edit
    end
  end

  private
  def polish_params
    params.require(:polish).permit(:brand, :name, :color, :style)
  end
end
