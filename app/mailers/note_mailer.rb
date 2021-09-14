class NoteMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def note_email
    @name = params[:user_name]
    @email = params[:to_email]
    @note = params[:note]
    mail(to: @email, subject: "Note from #{@name}")
  end
end
