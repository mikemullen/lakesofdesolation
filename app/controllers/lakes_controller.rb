class LakesController < ApplicationController

  def new
  end

  def index
    @lakes = Lake.all
    @lakessorted = @lakes.sort_by { |l| l.alphaname }
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
    if @lake.update(params[:lake].permit(:name, :filename, :visited, :alphaname))
      redirect_to @lake
    else
      render 'edit'
    end
  end

  private
    def lake_params
    	params.require(:lake).permit(:name, :slug, :filename, :visited, :alphaname)
    end

end