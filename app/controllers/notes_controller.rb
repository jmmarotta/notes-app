class NotesController < ApplicationController
  before_action :set_note, only: %i[ update destroy send_email ]
  before_action :set_notes, only: %i[ index create ]

  # GET /notes
  def index
  end

  # POST /notes
  def create
    if @note.save
      redirect_to notes_path, notice: "Note was successfully created."
    else
      flash.now[:alert] = "Note could not be created."
      render :index, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      redirect_to notes_path, notice: "Note was successfully updated."
    else
      flash.now[:alert] = "Note could not be updated."
      render :index, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
    redirect_to notes_url, notice: "Note was successfully destroyed."
  end

  # GET /notes/1/send
  def send_email
    to_email = params[:share][:to_email]
    begin
      NoteMailer.with(note: @note, to_email: to_email, name: current_user.full_name).note_email.deliver_now
      flash[:notice] = "Note was sent to #{to_email}."
    rescue
      flash[:alert] = "Email did not send."
    end
    redirect_to notes_url
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
