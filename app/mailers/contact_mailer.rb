class ContactMailer < ApplicationMailer
  default from: "no_reply@chinchilla.com"

  def received_email(contact)
    @contact = contact
    mail(:to => contact.email, :subject => 'お問い合わせを承りました')
  end
end
