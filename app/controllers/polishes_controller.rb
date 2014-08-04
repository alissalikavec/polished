class PolishesController < ApplicationController
  def index
  	@polishes = Polish.all
  end

  def show
  	@polish = Polish.find(params[:id])
  end

  def new
  end

  def edit
  end
end
