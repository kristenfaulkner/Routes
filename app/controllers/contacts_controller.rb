class ContactsController < ApplicationController
  
  def create
    contact = Contact.new(params[:contact].require(:user_id).permit(:name, :email))
    if contact.save
      render :json => contact
    else
      render :json => 
      contact.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  #works
  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render :json => contact
  end
   
  #I work (sort of)
  def index
    #contacts = Contact.contacts_for_user_id(params[:user_id])
    contacts = Contact.find(params[:user_id])
    render :json => contacts
  end


  #I work
  def show
    contact = Contact.find(params[:id])
    render :json => contact
  end
  
  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:id, :email, :name, :user_id)
  end
  
end

