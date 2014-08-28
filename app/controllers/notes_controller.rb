class NotesController < ApplicationController

  def new
    @note = Note.new
    @note.note_images.build
  end

  def create
  	@note = Note.new(note_params)
  	@note.save
  	redirect_to @note
  end

  def edit
  	@note = Note.friendly.find(params[:id])
    @note.note_images.build
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
      params.require(:note).permit(:id, :sort_date, :author, :title, :text, :photo, :imgcap, note_image_attributes: [ :id, :note_image, :caption, :note_id ])
    end

end