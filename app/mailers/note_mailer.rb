class NoteMailer < ApplicationMailer
  def note_email
    name = params[:name]
    @email = params[:to_email]
    @note = params[:note]
    mail(to: @email, subject: "#{name} sent you a Ruby-Note")
  end
end
