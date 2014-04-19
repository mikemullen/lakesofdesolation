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
  	@lake = Lake.friendly.find(params[:id])
    if request.path != lake_path(@lake)
      redirect_to @lake, status: :moved_permanently
    end
    @lakes = Lake.all
    @lakessorted = @lakes.sort_by { |l| l.alphaname }
    @lakesvisited = @lakessorted.each { |l| l.visited = true }
  end

  def edit
    @lake = Lake.friendly.find(params[:id])
  end

  def update
    @lake = Lake.friendly.find(params[:id])
    if @lake.update(lake_params)
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