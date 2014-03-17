class LakesController < ApplicationController

  def new
  end

  def index
    @lakes = Lake.all
  end

  def create
  	@lake = Lake.new(lake_params)
  	@lake.save
  	redirect_to @lake
  end

  def show
  	@lake = Lake.find(params[:id])
  end

  def edit
    @lake = Lake.find(params[:id])
  end

  def update
    @lake = Lake.find(params[:id])
    if @lake.update(params[:lake].permit(:filename, :visited))
      redirect_to @lake
    else
      render 'edit'
    end
  end

  private
    def lake_params
    	params.require(:lake).permit(:name, :slug, :filename, :visited)
    end

end