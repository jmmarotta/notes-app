class NoteMailer < ApplicationMailer
  default from: 'notes-no-reply@ruby-notes.heroku.com'

  def note_email
    name = params[:name]
    @email = params[:to_email]
    @note = params[:note]
    mail(to: @email, subject: "Note from #{name}")
  end
end
