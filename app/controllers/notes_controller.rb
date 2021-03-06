class NotesController < ApplicationController

  def new
  end

  def create
  	@note = Note.new(note_params)
  	@note.save
  	redirect_to @note
  end

  def edit
  	@note = Note.friendly.find(params[:id])
  end

  def update
  	@note = Note.friendly.find(params[:id])

  	if @note.update_attributes(note_params)
  	  redirect_to @note
  	else
      render 'edit'
    end
  end

  def index
  	@notes = Note.all
    @lastnoteid = Note.last.id
  end

  def show
  	@note = Note.friendly.find(params[:id])
    if request.path != note_path(@note)
      redirect_to @note, status: :moved_permanently
    end
  end

  def destroy
    Note.friendly.find(params[:id]).destroy
    redirect_to notes_url
  end

  private
    def note_params
      params.require(:note).permit(:sort_date, :author, :title, :text, :photo, :imgcap)
    end

end