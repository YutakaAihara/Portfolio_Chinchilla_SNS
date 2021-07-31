class Public::ContactsController < ApplicationController
  before_action :authenticate_owner!
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    if @contact.valid?
      render action: 'confirm'
    else
      render action: 'new'
    end
  end

  def thanks
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    ContactMailer.received_email(@contact).deliver
    
    render action: 'thanks'
  end
end
