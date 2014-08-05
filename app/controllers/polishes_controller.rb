class PolishesController < ApplicationController
  def index
  	@polishes = Polish.all
  end

  def show
  	@polish = Polish.find(params[:id])
  end

  def new
    @polish = Polish.new
  end

  def create
    @polish = current_user.polishes.build(params.require(:polish).permit(:brand, :name, :color, :style))
    if @polish.save
      flash[:notice] = "Polish saved!"
      redirect_to @polish
    else
      flash[:error] = "There was a problem saving your polish. Please try again."
      render :new
    end
  end

  def destroy
  end

  def edit
    @polish = Polish.find(params[:id])
  end

  def update
    @polish = Polish.find(params[:id])
    if @polish.update_attributes(params.require(:polish).permit(:brand, :name, :color, :style))
      flash[:notice] = "Polish details updated."
      redirect_to @polish
    else
      flash[:error] = "There was an error saving this polish. Please try again!"
      render :edit
    end
  end
end
