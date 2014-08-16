class LakesController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :create, :destroy, :new]

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
    @lakesvisited = @lakessorted.delete_if { |l| l.visited == false }
    @maxindex = @lakesvisited.count - 1
    @lakeindexpoint = @lakesvisited.find_index { |l| l.name == @lake.name }
    @prevlakeindex = @lakeindexpoint - 1
    @prevlake = @lakesvisited[@prevlakeindex]
    if @lakeindexpoint == @maxindex
      @nextlakeindex = 0
      @nextlake = @lakesvisited[@nextlakeindex]
    else
      @nextlakeindex = @lakeindexpoint + 1
      @nextlake = @lakesvisited[@nextlakeindex]
    end
    
    #@lakeid = @lake.id
    #currentlakeindex = @lakesvisited.index(lakeid)
    #nextlakeindex = currentlakeindex
    #@nextlake = @lakesvisited[nextlakeindex]
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

  def destroy
    Lake.friendly.find(params[:id]).destroy
    redirect_to lakes_url
  end

  private
    def lake_params
    	params.require(:lake).permit(:name, :slug, :filename, :visited, :alphaname)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

end