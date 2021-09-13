class NotesController < ApplicationController
  before_action :set_note, only: %i[ update destroy ]
  before_action :set_notes, only: %i[ index create ]

  # GET /notes or /notes.json
  def index
  end

  # POST /notes or /notes.json
  def create
    if @note.save
      redirect_to notes_path, notice: "Note was successfully created."
    else
      flash.now[:alert] = "Note could not be created."
      render :index, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    if @note.update(note_params)
      redirect_to notes_path, notice: "Note was successfully updated."
    else
      flash.now[:alert] = "Note could not be updated."
      render :index, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy
    redirect_to notes_url, notice: "Note was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:title, :body)
    end

    def set_notes
      user_notes = current_user.notes
      @notes = user_notes.where.not(id: nil)
      @note = action_name != 'create' ? user_notes.build : user_notes.build(note_params)
    end
end
