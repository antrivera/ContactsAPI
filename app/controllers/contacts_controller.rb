class ContactsController < ApplicationController
  def index
    @contacts = User.find(params[:user_id]).contacts
    @shared_contacts = User.find(params[:user_id]).shared_contacts
    @res = {
      contacts: @contacts,
      shared_contacts: @shared_contacts
    }
    render json: @res
    # render json: @shared_contacts
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render(
      json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    @contact = Contact.find(params[:id])

    if @contact
      render json: @contact
    else
      render(json: @contact.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(contact_params)
      render json: @contact
    else
      render(json: @contact.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    if @contact.destroy
      render json: @contact
    else
      render(json: @contact.errors.full_messages)
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
