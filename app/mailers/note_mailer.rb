class NoteMailer < ApplicationMailer
  def note_email
    name = params[:name]
    @email = params[:to_email]
    @note = params[:note]
    mail(to: @email, subject: "Note from #{name}")
  end
end
